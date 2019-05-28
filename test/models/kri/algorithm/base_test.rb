class KRI::Algorithm::BaseTest < ActiveSupport::TestCase
  #Mocked class
  class SpecificAlgorithm < KRI::Algorithm::Base
    require_document :serasa_relato
    configure_identifier code: 'KRI 0001' ,
                         title: 'Very Specific Algorithm',
                         description: 'Very specific description'

    def call

    end
  end

  test 'configure required documents' do
    assert SpecificAlgorithm.required_documents.count == 1
  end

  test 'search required documents before executing the algorithm' do
    SpecificAlgorithm.expects(:search_documents)
    SpecificAlgorithm.call
  end

  test 'configure KRI title' do
    assert SpecificAlgorithm.title == 'Very Specific Algorithm'
  end

  test 'configure KRI code' do
    assert SpecificAlgorithm.code == 'KRI 0001'
  end

  test 'configure KRI description' do
    assert SpecificAlgorithm.description == 'Very specific description'
  end

  test 'generate a KeyRiskIdentifier with a red flag' do
    algorithm = SpecificAlgorithm.new
    kri = algorithm.red!
    assert kri.flag == KRI::Algorithm::Base::RED_FLAG
  end

  test 'generate a KeyRiskIdentifier with a yellow flag' do
    algorithm = SpecificAlgorithm.new
    kri = algorithm.yellow!
    assert kri.flag == KRI::Algorithm::Base::YELLOW_FLAG
  end

  test 'generate a KeyRiskIdentifier with a green flag' do
    algorithm = SpecificAlgorithm.new
    kri = algorithm.green!
    assert kri.flag == KRI::Algorithm::Base::GREEN_FLAG
  end
end
