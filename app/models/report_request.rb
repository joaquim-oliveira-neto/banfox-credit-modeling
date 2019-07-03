# == Schema Information
#
# Table name: report_requests
#
#  id                :bigint           not null, primary key
#  cnpj              :string
#  user_id           :bigint
#  company_report_id :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class ReportRequest < ApplicationRecord
  belongs_to :user
  belongs_to :company_report, optional: true
  validates :cnpj, format: { with: /\d{14}/, message: "Retire os caracteres especiais" }
  validates :company_report, presence: true
end
