module Risk
  module Repository
    #TODO change the name for analysis
    class KeyIndicatorReport < ApplicationRecord
      self.table_name = 'key_indicator_reports'
    end
  end
end
