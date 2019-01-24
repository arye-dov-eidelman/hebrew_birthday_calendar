class SessionsController < ApplicationController
  skip_before_action :require_login
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.authenticate(params[:user][:password])
      login
      redirect_to(root_path)
      byebug
    else
      render(:new)
      byebug
    end

  end

  def destroy
    logout
    redirect_to(root_path)
  end

end
