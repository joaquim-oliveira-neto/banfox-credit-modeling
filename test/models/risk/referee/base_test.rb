class Risk::Referee::BaseTest < ActiveSupport::TestCase
  #Mocked class
  class SpecificReferee < Risk::Referee::Base
    require_external_service :serasa_relato
    configure_identifier code: 'Risk 0001' ,
                         title: 'Very Specific Referee',
                         description: 'Very specific description'

    def build_up
    end

    def call
    end
  end

  test 'configure required documents' do
    assert SpecificReferee.required_external_services.count == 1
  end

  test 'search required documents before executing the algorithm' do
    SpecificReferee.expects(:search_documents)
    SpecificReferee.call
  end

  test 'configure Risk title' do
    assert SpecificReferee.title == 'Very Specific Referee'
  end

  test 'configure Risk code' do
    assert SpecificReferee.code == 'Risk 0001'
  end

  test 'configure Risk description' do
    assert SpecificReferee.description == 'Very specific description'
  end

  test 'generate a KeyRiskIdentifier with a red flag' do
    algorithm = SpecificReferee.new
    kri = algorithm.red!
    assert kri.flag == Risk::Referee::Base::RED_FLAG
  end

  test 'generate a KeyRiskIdentifier with a yellow flag' do
    algorithm = SpecificReferee.new
    kri = algorithm.yellow!
    assert kri.flag == Risk::Referee::Base::YELLOW_FLAG
  end

  test 'generate a KeyRiskIdentifier with a green flag' do
    algorithm = SpecificReferee.new
    kri = algorithm.green!
    assert kri.flag == Risk::Referee::Base::GREEN_FLAG
  end
end
