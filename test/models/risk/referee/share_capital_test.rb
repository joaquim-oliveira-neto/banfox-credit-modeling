require 'test_helper'

class Risk::Referee::ShareCapitalTest < ActiveSupport::TestCase
  setup do
    @entity = Risk::Entity::Serasa::CorporateControl.new(
      share_capital: 6000,
      realized_capital: 6000
    )
    @referee = Risk::Referee::ShareCapital.new(@entity)
  end

  test '.call generates a red flag' do
    Risk::Repository::KeyIndicator.expects(:create).with({
      code: '',
      title: '',
      description: '',
      flag: Risk::Referee::ShareCapital::RED_FLAG
    })

    @referee.call
  end

  test '.call generates a yellow flag' do
    Risk::Repository::KeyIndicator.expects(:create).with({
      code: '',
      title: '',
      description: '',
      flag: Risk::Referee::ShareCapital::YELLOW_FLAG
    })

    @entity.share_capital = 15_000

    @referee.call
  end

  test '.call generates a green flag' do
    Risk::Repository::KeyIndicator.expects(:create).with({
      code: '',
      title: '',
      description: '',
      flag: Risk::Referee::ShareCapital::GREEN_FLAG
    })

    @entity.share_capital = 50_000

    @referee.call
  end
end
