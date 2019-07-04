require 'test_helper'

class Risk::KeyIndicatorTest < ActiveSupport::TestCase

  setup do
    @key_indicator = Risk::KeyIndicator.new
  end

  test '.red! should persist the key indicator with flag RED' do
    @key_indicator.red!
    expected = @key_indicator.flag
    assert_equal expected, Risk::KeyIndicator::RED_FLAG
    assert_equal false, @key_indicator.new_record?
  end

  test '.yellow! should persist the key indicator with flag YELLOW' do
    @key_indicator.yellow!
    expected = @key_indicator.flag
    assert_equal expected, Risk::KeyIndicator::YELLOW_FLAG
    assert_equal false, @key_indicator.new_record?
  end

  test '.green! should persist the key indicator with flag GREEN' do
    @key_indicator.green!
    expected = @key_indicator.flag
    assert_equal expected, Risk::KeyIndicator::GREEN_FLAG
    assert_equal false, @key_indicator.new_record?
  end

  test '.gray! should persist the key indicator with flag GRAY' do
    @key_indicator.gray!
    expected = @key_indicator.flag
    assert_equal expected, Risk::KeyIndicator::GRAY_FLAG
    assert_equal false, @key_indicator.new_record?
  end


end


