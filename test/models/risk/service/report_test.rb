require 'test_helper'

class Risk::Service::ReportTest < ActiveSupport::TestCase
  def described_class
    Risk::Service::Report
  end

  def input_data(cnpj = "")
    {
      cnpj: cnpj
    }
  end

  def correct_cnpj
    '11.473.393/0001-77'
  end

  test 'validate presence of cnpj' do
    assert_equal false, described_class.call(input_data, 'new_seller')
  end

  test 'validate cnpj format' do
    wrong_cnpj = '65.492.164/0001-49'
    assert_equal false, described_class.call(input_data(wrong_cnpj), 'new_seller')
  end

  test 'creates a KeyRiskIndicatorReport' do
    assert_difference 'Risk::Repository::KeyRiskIndicatorReport.count' do
      described_class.call(input_data(correct_cnpj), 'new_seller')
    end
  end

  test 'returns a KeyRiskIndicatorReport' do
    report = described_class.call(input_data(correct_cnpj), 'new_seller')
    assert_equal Risk::Repository::KeyRiskIndicatorReport, report.class
  end

  test 'choose new_seller pipeline' do
    Risk::Pipeline::NewSeller.expects(:call)

    described_class.call(input_data(correct_cnpj), 'new_seller')
  end
end
