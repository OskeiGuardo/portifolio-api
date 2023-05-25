class ApplicationController < ActionController::API
  before_action :set_current_user

  private

  def set_current_user
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
      @current_user = User.find(jwt_payload['sub'])
    else
      @current_user = nil
    end
  end
end
