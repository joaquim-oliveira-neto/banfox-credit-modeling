module Risk
  module Referee
    class Base
      RED_FLAG = -1
      YELLOW_FLAG = 1
      GREEN_FLAG = 0
      # Methods to create KeyRiskIdentifier with its respectives flags
      {
        red: RED_FLAG,
        green: GREEN_FLAG,
        yellow: YELLOW_FLAG
      }.each do |method, flag|
        define_method(:"#{method}!") do
          ::Risk::Repository::KeyRiskIndicator.create(
            title: self.class.title,
            description: self.class.description,
            code: self.class.code,
            flag: flag
          )
        end
      end

      class << self
        attr_reader :code, :title, :description, :services

        def configure_identifier(**params)
          @code = params[:code] unless params[:code].nil?
          @title = params[:title] unless params[:title].nil?
          @description = params[:description] unless params[:description].nil?
        end

        def prefetch_services(*services)
          @@services = services
        end

        def services
          @@services
        end

        def call(**args)
          new.call(args)
        end
      end
    end
  end
end
