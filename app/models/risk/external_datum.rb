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

module Risk
  class ExternalDatum < ApplicationRecord
    belongs_to :key_indicator_report, class_name: 'Risk::KeyIndicatorReport'
  end
end
