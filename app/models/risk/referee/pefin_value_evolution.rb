module Risk
  module Referee
    class PefinValueEvolution < Base
      # @param must be a reverse ordered array
      # @type Risk::Entity::Serasa::CompanySummary
      def initialize(company_summaries=[])
        @company_summaries = company_summaries
        @code = ''
        @title = ''
        @description = ''
      end

      def call
        if @company_summaries.size < 2
          gray!
        else
          current_value = @company_summaries.first.pefin[:value]
          historic_value = @company_summaries.last.pefin[:value]
          if current_value <= historic_value
            green!
          elsif (current_value - historic_value).to_f / historic_value <= 0.5
            yellow!
          else
            red!
          end
        end
      end

    end
  end
end
