class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def delete
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login
      redirect_to(root_path)
    else
      render(:new)
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params) ? redirect_to(@user) : render(:edit)
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      logout
      redirect_to(root_path)
    else
      render(:delete)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end
