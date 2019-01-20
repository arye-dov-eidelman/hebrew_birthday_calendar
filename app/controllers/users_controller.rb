class UsersController < ApplicationController
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
    @user.save ? redirect_to(@user) : render(:new)
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params) ? redirect_to(@user) : render(:edit)
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy ? redirect_to(root_path) : render(:delete)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end
