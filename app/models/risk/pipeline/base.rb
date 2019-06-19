module Risk
  module Pipeline
    class Base
      class << self
        def referee_list(*referees)
          @@referees = referees
        end

        def referees
          @@referees
        end

        def call(input_data, report)
          new(input_data, report).call
        end
      end

      def initialize(service_data, report)
        @service_data = service_data
        @report = report
      end

      def call
      end
    end
  end
end
