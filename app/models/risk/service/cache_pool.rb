module Risk
  module Service
    class CachePool
      attr_reader :cache_engine

      def self.call(service_class, service_params, ttl = 60)
        new(service_class, service_params, ttl).call
      end

      def initialize(service_class, service_params, ttl = 60)
        @service_class = service_class
        @service_params = service_params
        @ttl = ttl
      end

      def call
        @cache_key = generate_cache_key(@service_class, @service_params)
      end

      def generate_cache_key(service_class, service_params)
        key_string   = service_params.keys.reduce('') { |r, v| r + v.to_s }
        value_string = service_params.values.reduce('') { |r, v| r + v.to_s }

        "#{service_class.name.parameterize}_#{key_string}_#{value_string}"
      end
    end
  end
end
