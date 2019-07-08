class Api::V1::BaseController < ActionController::API
  before_action :verify_jwt_authenticity

  #QUESTION: why the order of theses 4 lines below matter? I mean, why StandardError neeed to come first?
  rescue_from StandardError,                with: :internal_server_error
  rescue_from JWT::ExpiredSignature,        with: :expired
  rescue_from JWT::VerificationError,       with: :not_authentic
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def verify_jwt_authenticity
    received_jwt = request.headers['bearer']
    JWT.decode received_jwt, Rails.application.credentials.jwt_secret, true, { algorithm: 'HS256' }
  end

  def expired(exception)
    if Rails.env.production?
      response = { error: "Forbidden" }
    else
      response =  { error_type: exception.class.to_s, error: exception.message, backtrace: exception.backtrace }
    end
    render json: response, status: :forbidden
  end

  def not_authentic(exception)
    if Rails.env.production?
      response = { error: "Unauthorized" }
    else
      response =  { error_type: exception.class.to_s, error: exception.message, backtrace: exception.backtrace }
    end
    render json: response, status: :unauthorized
  end

  # TODO: test it
  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  # TODO: test it
  def internal_server_error(exception)
    if Rails.env.production?
      response = { error: "Internal Server Error" }
    else
      response = { error_type: exception.class.to_s, error: exception.message, backtrace: exception.backtrace }
    end
    render json: response, status: :internal_server_error
  end

end
