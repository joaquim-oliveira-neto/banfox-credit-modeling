# == Schema Information
#
# Table name: key_indicator_reports
#
#  id         :bigint           not null, primary key
#  input_data :jsonb
#  pipeline   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Risk
  #TODO change the name for analysis
  class KeyIndicatorReport < ApplicationRecord
    self.table_name = 'key_indicator_reports'
  end
end
