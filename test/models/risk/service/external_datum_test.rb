require 'test_helper'

class Risk::Service::ExternalDatumTest < ActiveSupport::TestCase
  class TestFetcher
    def self.name
      'test_source'
    end

    def self.call(*)
      {
        very_important_data: 1
      }
    end
  end


  test '.call returns cached external_datum' do
    cached_external_datum = FactoryBot.create(:external_datum)

    Risk::ExternalDatum.expects(:create).never

    external_datum = Risk::Service::ExternalDatum.call(TestFetcher, 
                                                       cached_external_datum.query,
                                                       10.seconds)

    assert_equal [cached_external_datum], external_datum
  end

  test '.call calls fetcher if ttl is expired and returns expired as historic' do
    expired_ttl_datum = FactoryBot.create(:external_datum, :expired_ttl)

    TestFetcher.expects(:call).returns({ very_important_data: 1})

    external_datum = Risk::Service::ExternalDatum.call(TestFetcher, 
                                                       expired_ttl_datum.query,
                                                       10.seconds)
    
    expected = [expired_ttl_datum, external_datum.first]

    assert_equal expected, external_datum
  end
end
