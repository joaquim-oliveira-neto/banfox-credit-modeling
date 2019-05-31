require 'test_helper'

module Risk
  module Referee
    class CompanyStatusTest < ::ActiveSupport::TestCase
      def mocked_cnpj
        '11111111102'
      end

      def mocked_serasa_response_green
        {
          "dados_controle_empresa": {
            "codigo_situacao_empresa": "ativo"
          }
        }
      end

      def mocked_serasa_response_yellow
        {
          "dados_controle_empresa": {
            "codigo_situacao_empresa": ''
          }
        }
      end

      def mocked_serasa_response_red
        {
          "dados_controle_empresa": {
            "codigo_situacao_empresa": "inativo"
          }
        }
      end

      def green_params
        {
          code: 'Referee::CompanyStatus',
          title: 'Company Status',
          description: 'Check if company status on serasa is active',
          flag: Risk::Referee::CompanyStatus::GREEN_FLAG
        }
      end

      def yellow_params
        {
          code: 'Referee::CompanyStatus',
          title: 'Company Status',
          description: 'Check if company status on serasa is active',
          flag: Risk::Referee::CompanyStatus::YELLOW_FLAG
        }
      end

      def red_params
        {
          code: 'Referee::CompanyStatus',
          title: 'Company Status',
          description: 'Check if company status on serasa is active',
          flag: Risk::Referee::CompanyStatus::RED_FLAG
        }
      end

      test "calls Serasa service" do
        Risk::Service::Serasa.expects(:call)
                             .with({cnpj: mocked_cnpj})
                             .returns(mocked_serasa_response_green)

        Risk::Referee::CompanyStatus.call(cnpj: mocked_cnpj)
      end

      test "generates a green flag if status is 'ativo'" do
        Risk::Service::Serasa.expects(:call)
                             .with({cnpj: mocked_cnpj})
                             .returns(mocked_serasa_response_green)

        Risk::Repository::KeyRiskIdentifier.expects(:create).with(green_params)
        Risk::Referee::CompanyStatus.call(cnpj: mocked_cnpj)
      end

      test 'genereates a yellow flat is status was not found' do
        Risk::Service::Serasa.expects(:call)
                             .with({cnpj: mocked_cnpj})
                             .returns(mocked_serasa_response_yellow)

        Risk::Repository::KeyRiskIdentifier.expects(:create).with(yellow_params)
        Risk::Referee::CompanyStatus.call(cnpj: mocked_cnpj)
      end

      test "generates a red flat is status is 'inativo'" do
        Risk::Service::Serasa.expects(:call)
                             .with({cnpj: mocked_cnpj})
                             .returns(mocked_serasa_response_red)

        Risk::Repository::KeyRiskIdentifier.expects(:create).with(red_params)
        Risk::Referee::CompanyStatus.call(cnpj: mocked_cnpj)
      end
    end
  end
end
