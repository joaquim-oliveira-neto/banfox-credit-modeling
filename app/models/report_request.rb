class ReportRequest < ApplicationRecord
  belongs_to :user
  belongs_to :company_report, optional: true
  validates :cnpj, format: { with: /\d{14}/, message: "Retire os caracteres especiais" }
  validates :company_report, presence: true
end
