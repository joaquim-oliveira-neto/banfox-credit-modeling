class CreateReportRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :report_requests do |t|
      t.string     :cnpj
      t.references :user, foreign_key: true, index: true
      t.references :company_report, foreign_key: true, index: true

      t.timestamps
    end
  end
end
