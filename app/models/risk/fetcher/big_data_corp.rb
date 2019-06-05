module Risk
  module Fetcher
    class BigDataCorp
      attr_reader :cnpj, :access_token

      def self.call(cnpj)
        new(cnpj)
      end

      def initialize(query)
        @query = query
        @query['AccessToken'] = Rails.application.credentials.big_boost_api_token
      end

      def invalid_params!
        @invalid_params = true
      end

      def self.basic_data(cnpj)
        invalid_params! unless CNPJ.valid?(cnpj)
        query = {
          'Datasets' => 'basic_data',
          'q' => "doc{#{cnpj}}",
        }
        new(query)
      end

      def call
        return false if @invalid_params
        headers = {
          'Content-Type' => 'application/json'
        }

        HTTParty.get(
          'https://bigboost.bigdatacorp.com.br/companies',
          query: @query,
          headers: headers
        )
      end
    end
  end
end
