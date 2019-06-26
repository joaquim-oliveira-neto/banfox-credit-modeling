module Risk
  module Referee
    class Base
      attr_reader :code, :title, :description, :services


      # Methods to create KeyRiskIdentifier with its respectives flags
      {
        red: Risk::KeyIndicator::RED_FLAG,
        green: Risk::KeyIndicator::GREEN_FLAG,
        yellow: Risk::KeyIndicator::YELLOW_FLAG,
        gray: Risk::KeyIndicator::GRAY_FLAG,
      }.each do |method, flag|
        define_method(:"#{method}!") do
          ::Risk::KeyIndicator.create(
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
