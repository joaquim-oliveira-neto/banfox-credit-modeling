module Risk
  class KeyIndicator < ApplicationRecord
    self.table_name = 'key_indicators'

    GRAY_FLAG   = -1
    GREEN_FLAG  = 0
    YELLOW_FLAG = 1
    RED_FLAG    = 2

    # Methods to persist the flags
    {
      red: Risk::KeyIndicator::RED_FLAG,
      green: Risk::KeyIndicator::GREEN_FLAG,
      yellow: Risk::KeyIndicator::YELLOW_FLAG,
      gray: Risk::KeyIndicator::GRAY_FLAG,
    }.each do |method, flag|
      define_method(:"#{method}!") do
        self.flag = flag
        self.save!
      end
    end
  end
end
