require 'test_helper'

class Risk::Referee::BaseTest < ActiveSupport::TestCase
  #Mocked class
  class SpecificReferee < Risk::Referee::Base
    configure_identifier code: 'Risk 0001' ,
                         title: 'Very Specific Referee',
                         description: 'Very specific description'

    def call
    end
  end

  test 'configure Risk title' do
    assert_equal SpecificReferee.title, 'Very Specific Referee'
  end

  test 'configure Risk code' do
    assert_equal SpecificReferee.code, 'Risk 0001'
  end

  test 'configure Risk description' do
    assert_equal SpecificReferee.description, 'Very specific description'
  end

  test 'generate a KeyRiskIdentifier with a red flag' do
    algorithm = SpecificReferee.new
    kri = algorithm.red!
    assert_equal kri.flag, Risk::Referee::Base::RED_FLAG
  end

  test 'generate a KeyRiskIdentifier with a yellow flag' do
    algorithm = SpecificReferee.new
    kri = algorithm.yellow!
    assert_equal kri.flag, Risk::Referee::Base::YELLOW_FLAG
  end

  test 'generate a KeyRiskIdentifier with a green flag' do
    algorithm = SpecificReferee.new
    kri = algorithm.green!
    assert_equal kri.flag, Risk::Referee::Base::GREEN_FLAG
  end
end
