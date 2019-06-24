module Risk
  module Referee
    class Base
      attr_reader :code, :title, :description, :services

      GRAY_FLAG   = -1
      GREEN_FLAG  = 0
      YELLOW_FLAG = 1
      RED_FLAG    = 2
      # Methods to create KeyRiskIdentifier with its respectives flags
      {
        red: RED_FLAG,
        green: GREEN_FLAG,
        yellow: YELLOW_FLAG,
        gray: GRAY_FLAG,
      }.each do |method, flag|
        define_method(:"#{method}!") do
          ::Risk::Repository::KeyIndicator.create(
            title: self.title,
            description: self.description,
            code: self.code,
            flag: flag
          )
        end
      end
    end
  end
end
