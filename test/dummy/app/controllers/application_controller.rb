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
    puts "\n\n\n@@@ CALLING current_user !!!\n@@@\n"
    if session[:user]
      user = User.new
      user.name = session[:user]
      user.admin(true) if session[:admin]
      puts "User: #{user.inspect} | admin? = #{user.admin?}"
      user
    else
      nil
    end
  end
end
