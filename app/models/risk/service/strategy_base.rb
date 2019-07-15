module Risk
  module Service
    class StrategyBase
      class << self
        attr_reader :pipelines

        def pipeline_list(*pipelines)
          @pipelines = pipelines
        end

      end

      def fetchers_required
        self.class.pipelines.map {|pipeline| pipeline.fetchers }
                            .reduce([]) {|fetchers, fetcher| fetchers += fetcher }
                            .uniq
      end
    end
  end
end
