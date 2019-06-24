FactoryBot.define do
  factory :evidence, class: Risk::Repository::Evidence do
    input_data { { cnpj: '96.006.288/0001-80' } }
    collected_data do
      {
        serasa_searches: {
          quantity: 100,
          last_occurrence: Date.new(2019, 6, 1)
        }
      }
    end
    referee_name { "Serasa::Searches" }
  end
end
