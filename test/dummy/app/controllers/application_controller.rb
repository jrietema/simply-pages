class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # This would be provided by Devise
  def authenticate_user!
    redirect_to 'sessions#new'
  end

  # Devise helper mocking
  def current_user
    @current_user ||= User.from_hash(session[:user])
  end
end
