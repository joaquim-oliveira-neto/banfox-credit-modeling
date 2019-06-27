module Risk
  module Referee
    class PefinValueEvolution < Base
      include DeltaEvaluator
      # entities must be a reverse ordered array
      # entities must have @type Risk::Entity::Serasa::CompanySummary
      def initialize(key_indicator_factory, company_summaries=[])
        @key_indicator_factory = key_indicator_factory
        @entities = company_summaries
        @code = ''
        @title = ''
        @description = ''
        @params = {green_limit: 0, yellow_limit: 0.5}
      end

      def call
        current_value = @entities.first.pefin[:value]
        historic_value = @entities.last.pefin[:value]
        evaluate_delta_for_negative_information(current_value, historic_value)
      end

    end
  end
end
