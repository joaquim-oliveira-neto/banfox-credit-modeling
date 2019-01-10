class CompanyReport < ApplicationRecord
  has_many :report_requests
  after_create :fetch_data_from_nogord

  def fetch_data_from_nogord
    url = Rails.application.credentials[Rails.env.to_sym][:nogord_url]
    headers = { Content_Type: "application/json", Authorization: Rails.application.credentials[:nogord_token] }
    body = { cnpj: "#{self.cnpj}" }.to_json
    data_serialized = RestClient.post(url, body, headers)
    self.data = JSON.parse(data_serialized)
    self.save!
  end
end
