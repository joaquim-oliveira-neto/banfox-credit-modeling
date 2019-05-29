require 'test_helper'

class Risk::Service::CachePoolTest < ActiveSupport::TestCase
  class MockedService
  end

  setup do
    @cache_pool = Risk::Service::CachePool.new(MockedService, {param_1: 1, param_2: 2})
  end

  test 'can generate the correct cache key' do
    cache_key = @cache_pool.generate_cache_key(MockedService, {param_1: 1, param_2: 2})
    expected_value = 'risk-service-cachepooltest-mockedservice_param_1param_2_12'

    assert_equal cache_key, expected_value
  end
end
