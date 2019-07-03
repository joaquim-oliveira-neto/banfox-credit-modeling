FactoryBot.define do
  factory :key_indicator_report, class: 'Risk::KeyIndicatorReport' do
    input_data do 
      {
        cnpj: "00310523911323"
      }
    end
  end
end
