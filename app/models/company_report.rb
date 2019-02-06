class CompanyReport < ApplicationRecord
  has_many :report_requests

  def fetch_data_from_nogord
    url = Rails.application.credentials[Rails.env.to_sym][:nogord_url]
    headers = { Content_Type: "application/json", Authorization: Rails.application.credentials[:nogord_token] }
    body = { cnpj: "#{self.cnpj}" }.to_json
    data_serialized = RestClient.post(url, body, headers)
    self.data = JSON.parse(data_serialized)
    self.save!
  end

  def informations
    data.fetch('info').fetch('external_sources').first.fetch('data').fetch('Result')
  end

  def basic_data
    informations.fetch("BasicData")
  end

  def addresses
    informations.fetch("Addresses")
  end

  def processes
    informations.fetch("Processes").fetch("Lawsuits")
  end

  def processes_suitor
    processes.select do |process|
      process["Parties"].any? do |partie|
        (partie["Polarity"] == "Active") && (partie["Doc"] == self.cnpj)
      end
    end
  end

  def processes_defendant
    processes.select do |process|
      process["Parties"].any? do |partie|
        (partie["Polarity"] == "Passive") && (partie["Doc"] == self.cnpj)
      end
    end
  end

  def relationships
    informations.fetch("Relationships")["Relationships"]
  end

  def activity_indicators
    informations.fetch("ActivityIndicators")
  end

  def domains
    informations.fetch("Domains")
  end

  def emails
    informations.fetch("Emails")
  end

  def phones
    informations.fetch("Phones")
  end

end
