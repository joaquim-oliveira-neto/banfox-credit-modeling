require 'test_helper'

class Risk::Referee::PefinValueEvolutionTest < ActiveSupport::TestCase
  test '.call should create a gray flag if there is only one company_summary' do
    @company_summaries = [
      Risk::Entity::Serasa::CompanySummary.new(
        pefin: {
          quantity: 10,
          value: 1000,
          last_ocurrence: Date.new(2018, 12, 21)
        }
      ),
    ]

    Risk::KeyIndicator.expects(:create).with({
      title: '',
      code: '',
      description: '',
      flag: Risk::KeyIndicator::GRAY_FLAG
    })

    Risk::Referee::PefinValueEvolution.new(@company_summaries).call
  end

  test '.call should create a green flag' do
    @company_summaries = [
      Risk::Entity::Serasa::CompanySummary.new(
        pefin: {
          quantity: 10,
          value: 900,
          last_ocurrence: Date.new(2018, 12, 21)
        }
      ),
      Risk::Entity::Serasa::CompanySummary.new(
        pefin: {
          quantity: 10,
          value: 1000,
          last_ocurrence: Date.new(2019, 1, 21)
        }
      ),
    ]

    Risk::KeyIndicator.expects(:create).with({
      title: '',
      code: '',
      description: '',
      flag: Risk::KeyIndicator::GREEN_FLAG
    })

    Risk::Referee::PefinValueEvolution.new(@company_summaries).call
  end

  test '.call should create a yellow flag' do
    @company_summaries = [
      Risk::Entity::Serasa::CompanySummary.new(
        pefin: {
          quantity: 9,
          value: 1500,
          last_ocurrence: Date.new(2018, 12, 21)
        }
      ),
      Risk::Entity::Serasa::CompanySummary.new(
        pefin: {
          quantity: 10,
          value: 1000,
          last_ocurrence: Date.new(2019, 1, 21)
        }
      ),
    ]

    Risk::KeyIndicator.expects(:create).with({
      title: '',
      code: '',
      description: '',
      flag: Risk::KeyIndicator::YELLOW_FLAG
    })

    Risk::Referee::PefinValueEvolution.new(@company_summaries).call
  end

  test '.call should create a red flag' do
    @company_summaries = [
      Risk::Entity::Serasa::CompanySummary.new(
        pefin: {
          quantity: 9,
          value: 1600,
          last_ocurrence: Date.new(2018, 12, 21)
        }
      ),
      Risk::Entity::Serasa::CompanySummary.new(
        pefin: {
          quantity: 10,
          value: 1000,
          last_ocurrence: Date.new(2019, 1, 21)
        }
      ),
    ]

    Risk::KeyIndicator.expects(:create).with({
      title: '',
      code: '',
      description: '',
      flag: Risk::KeyIndicator::RED_FLAG
    })

    Risk::Referee::PefinValueEvolution.new(@company_summaries).call
  end
end
