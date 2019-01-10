class CompanyReport < ApplicationRecord
  has_many :report_requests
  after_create :fetch_data_from_nogord

  def fetch_informations_from_nogord
    url = Rails.application.credentials[Rails.env.to_sym][:nogord_url]
    data_serialized = open(url).read
    self.data = JSON.parse(data_serialized)
    self.save!
  end
end
