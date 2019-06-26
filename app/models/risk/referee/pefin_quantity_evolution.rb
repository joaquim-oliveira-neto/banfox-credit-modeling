module Risk
  module Referee
    class PefinQuantityEvolution < Base
      # @param must be a reverse ordered array
      # @type Risk::Entity::Serasa::CompanySummary
      def initialize(key_indicator_factory, company_summaries=[])
        @key_indicator_factory = key_indicator_factory
        @company_summaries = company_summaries
        @code = ''
        @title = ''
        @description = ''
      end

      def call
        if @company_summaries.size < 2
          @key_indicator_factory.build(self).gray!
        else
          current_quantity = @company_summaries.first.pefin[:quantity]
          historic_quantity = @company_summaries.last.pefin[:quantity]
          if current_quantity <= historic_quantity
            @key_indicator_factory.build(self).green!
          elsif (current_quantity - historic_quantity).to_f / historic_quantity <= 0.5
            @key_indicator_factory.build(self).yellow!
          else
            @key_indicator_factory.build(self).red!
          end
        end
      end
    end
  end
end
