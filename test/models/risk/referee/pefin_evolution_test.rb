require 'test_helper'

class Risk::Referee::PefinEvolutionTest < ActiveSupport::TestCase
  setup do
    @company_summaries = [
      Risk::Entity::Serasa::CompanySummary.new(
        pefin: {
          quantity: 10,
          value: 1000,
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
    @referee = Risk::Referee::PefinEvolution.new(@company_summaries)
  end

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

    @referee = Risk::Referee::PefinEvolution.new(@company_summaries)

    Risk::Repository::KeyIndicator.expects(:create).with({
      title: '',
      code: '',
      description: '',
      flag: Risk::Referee::PefinEvolution::GRAY_FLAG
    })

    @referee.call
  end

  test '.call should create a green flag' do
   @company_summaries = [
      Risk::Entity::Serasa::CompanySummary.new(
        pefin: {
          quantity: 10,
          value: 1000,
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

   Risk::Repository::KeyIndicator.expects(:create).with({
      title: '',
      code: '',
      description: '',
      flag: Risk::Referee::PefinEvolution::GREEN_FLAG
   })

   Risk::Referee::PefinEvolution.new(@company_summaries).call
  end
end
