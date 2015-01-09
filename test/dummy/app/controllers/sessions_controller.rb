class SessionsController < ApplicationController

  def new

  end

  def create
    session[:user] = params[:username]
    session[:admin] = true unless params[:password].blank?
    redirect_to root_path
  end

  def destroy
    session[:user] = nil
    session[:admin] = false
    redirect_to root_path
  end

end