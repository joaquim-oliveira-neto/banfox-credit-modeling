require 'test_helper'

class ReportRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_report_request_url
    assert_response 302
  end
end
