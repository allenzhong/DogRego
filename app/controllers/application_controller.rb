class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  # layout :dynamic_layout

  def dynamic_layout
  	user_signed_in? ? 'application' : 'authentication'
  end
end
