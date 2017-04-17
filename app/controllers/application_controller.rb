class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  layout :dynamic_layout

  protected

  def dynamic_layout
  	user_signed_in? ? 'application' : 'authentication'
  end

  def configure_permitted_parameters
  	permit_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
  	devise_parameter_sanitizer.permit :sign_up, keys: permit_attrs
  	devise_parameter_sanitizer.permit :account_update, keys: permit_attrs
  end
end
