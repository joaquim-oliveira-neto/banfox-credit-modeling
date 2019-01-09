class CreateBdcBasicData < ActiveRecord::Migration[5.2]
  def change
    create_table :bdc_basic_data do |t|
      t.
        t.string :TaxIdNumber
        t.string :TaxIdCountry
        t.string :AlternativeIdNumbers
        t.string :OfficialName
        t.string :TradeName
        t.string :Aliases
        t.float :NameUniquenessScore
        t.datetime :FoundedDate
        t.float :Age
        t.boolean :IsHeadquarter
        t.string :HeadquarterState
        t.string :TaxIdStatus
        t.string :TaxIdOrigin


      t.timestamps
    end
  end
end
