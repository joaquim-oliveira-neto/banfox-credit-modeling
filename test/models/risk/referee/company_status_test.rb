require 'test_helper'

module Risk
  module Referee
    class CompanyStatusTest < ::ActiveSupport::TestCase
      def mocked_cnpj
        '11111111102'
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

      test "generates a green flag if status is 'ativo'" do
        presenter = mock()
        presenter.stubs(:status).returns('ativo')

        Risk::Repository::KeyIndicator.expects(:create).with(green_params)
        Risk::Referee::CompanyStatus.call(company: presenter)
      end

      test 'genereates a yellow flag is status was not found' do
        presenter = mock()
        presenter.stubs(:status).returns('')

        Risk::Repository::KeyIndicator.expects(:create).with(yellow_params)
        Risk::Referee::CompanyStatus.call(company: presenter)
      end

      test "generates a red flag is status is 'inativo'" do
        presenter = mock()
        presenter.stubs(:status).returns('inativo')

        Risk::Repository::KeyIndicator.expects(:create).with(red_params)
        Risk::Referee::CompanyStatus.call(company: presenter)
      end
    end
  end
end
