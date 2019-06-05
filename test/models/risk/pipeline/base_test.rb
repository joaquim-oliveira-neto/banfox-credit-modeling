require 'test_helper'

module Risk
  module Pipeline
    class BaseTest < ActiveSupport::TestCase
      class MockedReport
      end

      class MockedService
      end

      class MockedReferee
      end

      class SpecificPipeline < Risk::Pipeline::Base
        referee_list MockedReferee,
                     MockedReferee
      end

      def mocked_response
        {
          anything: 1
        }.with_indifferent_access
      end

      def mocked_input_data
        {
          cnpj: "00000000000"
        }.with_indifferent_access
      end

      test 'configure a list of referees' do
        expected = [MockedReferee, MockedReferee]
        assert_equal expected, SpecificPipeline.referees
      end
    end
  end
end
