module Risk
  module Service
    class ExternalDatum

      #@ttl in seconds
      def initialize(source, query, ttl, fetch_count=1)
        @source = source
        @query = query
        @ttl = ttl
        @fetch_count = fetch_count
      end

      def self.call(source, query, ttl)
        new(source, query, ttl).call
      end

      def call
        external_data = Risk::ExternalDatum.where(source: @source.name)
                                           .where(query: @query)
                                           .limit(@fetch_count)
                                           .order('created_at DESC')
                                           .to_a

        if external_data.first.ttl < DateTime.now
          new_external_data = @source.call(@query)
          new_external_datum = Risk::ExternalDatum.create(source: @source.name,
                                                          query: @query,
                                                          raw_data: new_external_data
                                                         )

          return [external_data, new_external_datum].flatten
        end

        external_data
      end
    end
  end
end
