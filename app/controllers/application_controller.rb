class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?

  include DeviseTokenAuth::Concerns::SetUserByToken

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  end
end
