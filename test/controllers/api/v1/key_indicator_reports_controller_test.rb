require 'test_helper'

class KeyIndicatorReportsControllerTest < ActionDispatch::IntegrationTest

  setup do
    def valid_jwt
      JWT.encode payload, Rails.application.credentials.jwt_secret, 'HS256'
    end

    def invalid_jwt
      JWT.encode payload, 'invalid_password', 'HS256'
    end

    def expired_jwt
      JWT.encode exp_payload, Rails.application.credentials.jwt_secret, 'HS256'
    end


    def payload
      { user_email: 'specific.user@company.com.br' }
    end

    def exp
      Time.current.to_i - 40
    end

    def exp_payload
      { user_email: 'specific.user@company.com.br', exp: exp }
    end

    def xml
      "specific xml"
    end
  end

  test "should return an error with an invalid jwt" do
    post(api_v1_key_indicator_reports_url,
      headers: { "bearer" => invalid_jwt },
      params: {
        kind: "verification_xml_authenticity",
        xml: xml,
      },
      as: :json
    )
    assert_response :unauthorized
  end

  test "should return an error if the jwt has expiried" do
    post(api_v1_key_indicator_reports_url,
      headers: { "bearer" => expired_jwt },
      params: {
        kind: "verification_xml_authenticity",
        xml: xml,
      },
      as: :json
    )
    assert_response :forbidden
  end

  test "should create and return a KeyIndicatorReports instance" do
    post(api_v1_key_indicator_reports_url,
      headers: { "autenthication" => valid_jwt },
      params: {
        kind: "verification_xml_authenticity",
        xml: xml,
      },
      as: :json
    )
    assert_response :success
  end
end
