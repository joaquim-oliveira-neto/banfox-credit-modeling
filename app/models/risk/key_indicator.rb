module Risk
  class KeyIndicator < ApplicationRecord
    self.table_name = 'key_indicators'

    GRAY_FLAG   = -1
    GREEN_FLAG  = 0
    YELLOW_FLAG = 1
    RED_FLAG    = 2
  end
end
