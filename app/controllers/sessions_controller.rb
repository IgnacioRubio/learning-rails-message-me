class SessionsController < ApplicationController
  before_action :loggin_redirect, only: [:new, :create]

  def new
  end

  def create
    username = params[:session][:username]
    password = params[:session][:password]

    user = User.find_by(username: username)

    if user && user.authenticate(password)
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully!"
      redirect_to root_path
    else
      flash.now[:error] = "There was something wrong with your login details!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been successfully logout!"
    redirect_to login_path
  end

  private

  def loggin_redirect
    if loggin?
      flash[:error] = "You are already logged ing"
      redirect_to root_path
    end
  end
  
end
