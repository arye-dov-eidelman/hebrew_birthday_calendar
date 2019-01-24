class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def logged_in_user
    @logged_in_user ||= User.find_by(id: session[:user_id])
  end

  def logged_out?
    !logged_in_user
  end

  def logged_in?
    !logged_out?
  end

  def require_login
    if logged_out?
      redirect_to(new_session_path)
    end
  end

  def login
    session[:user_id] = @user.id
  end

  def logout
    reset_session
  end
end
