# == Schema Information
#
# Table name: external_data
#
#  id                      :bigint           not null, primary key
#  source                  :string
#  raw_data                :jsonb
#  key_indicator_report_id :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  query                   :jsonb
#  ttl                     :datetime
#

FactoryBot.define do
  factory :external_datum, class: 'Risk::ExternalDatum' do
    key_indicator_report 

    source { "test_source" }
    query { { cnpj: '000000' } }
    ttl { DateTime.now + 1.hour }
    raw_data { "" }

    trait :expired_ttl do
      ttl { DateTime.now - 1.hour }
    end
  end
end
