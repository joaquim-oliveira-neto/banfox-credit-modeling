module Risk
  module Referee
    class PefinValueEvolution < Base
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
          current_value = @company_summaries.first.pefin[:value]
          historic_value = @company_summaries.last.pefin[:value]
          if current_value <= historic_value
            @key_indicator_factory.build(self).green!
          elsif (current_value - historic_value).to_f / historic_value <= 0.5
            @key_indicator_factory.build(self).yellow!
          else
            @key_indicator_factory.build(self).red!
          end
        end
      end

    end
  end
end
