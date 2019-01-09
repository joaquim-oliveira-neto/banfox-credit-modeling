class CreateCompanyReports < ActiveRecord::Migration[5.2]
  def change
    create_table :company_reports do |t|
      t.string :cnpj
      t.jsonb  :data

      t.timestamps
    end
  end
end
