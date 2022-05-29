class SessionsController < ApplicationController
  
  def new
  end

  def create
    flash[:notice] = "Successfully login"
    redirect_to root_path
  end
  
end
