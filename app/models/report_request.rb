class ReportRequest < ApplicationRecord
  belongs_to :user
  belongs_to :company_report, optional: true
end
