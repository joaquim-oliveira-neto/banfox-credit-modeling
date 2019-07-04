require 'test_helper'

class Risk::Referee::LawsuitQuantityDeltaTest < ActiveSupport::TestCase

  setup do
    @key_indicator_factory = Risk::KeyIndicatorFactory.new
  end

  test '.call should create a gray flag if there is only one company_summary' do
    @company_summaries = [
      Risk::Entity::Serasa::CompanySummary.new(
        lawsuit: {
          quantity: 10,
          value: 1000,
          last_ocurrence: Date.new(2018, 12, 21)
        }
      ),
    ]

    Risk::KeyIndicator.any_instance.expects(:gray!)

    Risk::Referee::LawsuitQuantityDelta.new(@key_indicator_factory, @company_summaries).call
  end

  test '.call should create green flag when the historic quantity is 0 and the entity is stable' do
     @company_summaries = [
      Risk::Entity::Serasa::CompanySummary.new(
        lawsuit: {
          quantity: 0,
          value: 0,
          last_ocurrence: ''
        }
      ),
      Risk::Entity::Serasa::CompanySummary.new(
        lawsuit: {
          quantity: 0,
          value: 0,
          last_ocurrence: ''
        }
      ),
    ]

    Risk::KeyIndicator.any_instance.expects(:green!)

    Risk::Referee::LawsuitQuantityDelta.new(@key_indicator_factory, @company_summaries).call
  end

  test '.call should create yellow flag when the historic quantity is 0 and the entity is growing' do
     @company_summaries = [
       Risk::Entity::Serasa::CompanySummary.new(
        lawsuit: {
          quantity: 0,
          value: 0,
          last_ocurrence: Date.new(2019, 1, 21)
        }
      ),
      Risk::Entity::Serasa::CompanySummary.new(
        lawsuit: {
          quantity: 10,
          value: 1000,
          last_ocurrence: Date.new(2018, 12, 21)
        }
      ),
    ]

    Risk::KeyIndicator.any_instance.expects(:yellow!)

    Risk::Referee::LawsuitQuantityDelta.new(@key_indicator_factory, @company_summaries).call
  end

  test '.call should create a green flag' do
    @company_summaries = [
      Risk::Entity::Serasa::CompanySummary.new(
        lawsuit: {
          quantity: 10,
          value: 1000,
          last_ocurrence: Date.new(2019, 1, 21)
        }
      ),
      Risk::Entity::Serasa::CompanySummary.new(
        lawsuit: {
          quantity: 10,
          value: 1000,
          last_ocurrence: Date.new(2018, 12, 21)
        }
      ),
    ]

    Risk::KeyIndicator.any_instance.expects(:green!)

    Risk::Referee::LawsuitQuantityDelta.new(@key_indicator_factory, @company_summaries).call
  end

  test '.call should create a yellow flag' do
    @company_summaries = [
      Risk::Entity::Serasa::CompanySummary.new(
        lawsuit: {
          quantity: 10,
          value: 1000,
          last_ocurrence: Date.new(2019, 1, 21)
        }
      ),
      Risk::Entity::Serasa::CompanySummary.new(
        lawsuit: {
          quantity: 15,
          value: 1000,
          last_ocurrence: Date.new(2018, 12, 21)
        }
      ),
    ]

    Risk::KeyIndicator.any_instance.expects(:yellow!)

    Risk::Referee::LawsuitQuantityDelta.new(@key_indicator_factory, @company_summaries).call
  end

  test '.call should create a red flag' do
    @company_summaries = [
      Risk::Entity::Serasa::CompanySummary.new(
        lawsuit: {
          quantity: 10,
          value: 1000,
          last_ocurrence: Date.new(2019, 1, 21)
        }
      ),
      Risk::Entity::Serasa::CompanySummary.new(
        lawsuit: {
          quantity: 16,
          value: 1000,
          last_ocurrence: Date.new(2018, 12, 21)
        }
      ),
    ]

    Risk::KeyIndicator.any_instance.expects(:red!)

    Risk::Referee::LawsuitQuantityDelta.new(@key_indicator_factory, @company_summaries).call
  end
end
