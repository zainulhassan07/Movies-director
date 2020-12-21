class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :password, :current_password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :name, :password, :current_password, :avatar])
  end

end
