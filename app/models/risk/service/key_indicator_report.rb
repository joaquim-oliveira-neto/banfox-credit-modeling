module Risk
  module Service
    class KeyIndicatorReport
      #ttl in minutes
      def initialize(input_data = {}, kind, ttl)
        @input_data = input_data
        @kind = kind
        @ttl = ttl
      end

      def call
        nonexpired_reports = Risk::KeyIndicatorReport.where(input_data: @input_data)
                                                     .where(kind: @kind)
                                                     .where('ttl >= ?', DateTime.now)

        return nonexpired_reports.last if nonexpired_reports.any?

        key_indicator_report = Risk::KeyIndicatorReport.create(
          input_data: @input_data,
          kind: @kind,
          ttl: @ttl
        )

        pipeline_strategy.call(key_indicator_report)

        key_indicator_report
      end

      def pipeline_strategy
        case @kind
        when 'operation_part'
          Risk::Service::OperationPartStrategy.new
        end
      end
    end
  end
end
