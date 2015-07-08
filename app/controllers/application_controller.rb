class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :name, :password, :current_password, :avatar) }
  end

  #changes default route of devise to specific route after login
  def after_sign_in_path_for(user)
    user_path(user)
  end
  def after_update_path_for(user)
    user_path(user)
  end
end
