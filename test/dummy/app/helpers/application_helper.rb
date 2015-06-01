module ApplicationHelper

  # Devise helper mocking
  def current_user
    @current_user ||= User.from_hash(session[:user])
  end

end
