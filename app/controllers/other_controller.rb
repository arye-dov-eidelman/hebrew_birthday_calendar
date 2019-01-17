class OtherController < ApplicationController
  def home
    redirect_to new_user_path
  end
end
