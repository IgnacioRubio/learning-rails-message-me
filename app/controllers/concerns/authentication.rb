module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user

    helper_method :loggin?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id].present?
  end
  
  def loggin?
    !!current_user
  end

  def require_user
    if !loggin?
      flash[:error] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end