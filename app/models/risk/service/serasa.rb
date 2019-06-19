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
        fetch_data(cnpj)
      end

      def fetch_data
      end
    end
  end
end
