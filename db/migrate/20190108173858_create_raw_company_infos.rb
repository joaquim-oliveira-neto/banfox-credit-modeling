class CreateRawCompanyInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :raw_company_infos do |t|
      t.string :cnpj
      t.text :content


      t.timestamps
    end
  end
end
