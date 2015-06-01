class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.new
    @user.name = params[:username]
    @user.admin(true) unless params[:password].blank?
    session[:user] = @user.to_hash
    redirect_to root_path
  end

  def destroy
    session[:user] = nil
    redirect_to root_path
  end

end