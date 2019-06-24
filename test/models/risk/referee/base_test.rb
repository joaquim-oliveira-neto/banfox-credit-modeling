require 'test_helper'

module Risk
  module Referee
    class BaseTest < ActiveSupport::TestCase
      class MockedService
      end

      #Mocked classes
      class SpecificReferee < Risk::Referee::Base
        def initialize
          @code = 'Risk 0001' 
          @title = 'Very Specific Referee'
          @description = 'Very specific description'
        end

        def call
        end
      end
      
      test 'configure Risk title' do
        expected = 'Very Specific Referee'
        assert_equal expected, SpecificReferee.new.title
      end

      test 'configure Risk code' do
        expected = 'Risk 0001' 
        assert_equal expected, SpecificReferee.new.code
      end

      test 'configure Risk description' do
        expected = 'Very specific description'
        assert_equal expected, SpecificReferee.new.description
      end

      test 'generate a KeyRiskIndicator with a red flag' do
        algorithm = SpecificReferee.new
        kri = algorithm.red!
        expected = kri.flag
        assert_equal expected, Risk::Referee::Base::RED_FLAG
      end

      test 'generate a KeyRiskIndicator with a yellow flag' do
        algorithm = SpecificReferee.new
        kri = algorithm.yellow!
        expected = kri.flag
        assert_equal expected, Risk::Referee::Base::YELLOW_FLAG
      end

      test 'generate a KeyRiskIndicator with a green flag' do
        algorithm = SpecificReferee.new
        kri = algorithm.green!
        expected = kri.flag
        assert_equal expected, Risk::Referee::Base::GREEN_FLAG
      end
    end
  end
end
