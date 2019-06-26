module Risk
  module Service
    class Serasa
      attr_reader :cnpj
      
      def self.call(cnpj)
        new(cnpj).call
      end

      def initialize(cnpj)
        @cnpj = cnpj
      end

      def call
        data = fetch_data(cnpj)

        Risk::Deserializer::NogordSerasa.new(data).call
      end

      def fetch_data(cnpj)
        @data ||= Risk::Fetcher::NogordSerasa.call(cnpj)
        @data['info']['external_sources'].first['data']
      end
    end
  end
end
