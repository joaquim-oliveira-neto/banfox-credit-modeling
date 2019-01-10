require 'test_helper'

class ReportRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get report_requests_new_url
    assert_response :success
  end

end
