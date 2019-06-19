module Risk
  module Repository
    #TODO change the name for analysis
    class KeyRiskIndicatorReport < ApplicationRecord
      self.table_name = 'key_risk_indicator_reports'
    end
  end
end
