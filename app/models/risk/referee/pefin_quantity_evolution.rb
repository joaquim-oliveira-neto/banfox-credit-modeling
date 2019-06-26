module Risk
  module Referee
    class PefinQuantityEvolution < Base
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
          current_quantity = @company_summaries.first.pefin[:quantity]
          historic_quantity = @company_summaries.last.pefin[:quantity]
          if current_quantity <= historic_quantity
            green!
          elsif (current_quantity - historic_quantity).to_f / historic_quantity <= 0.5
            yellow!
          else
            red!
          end
        end
      end
    end
  end
end
