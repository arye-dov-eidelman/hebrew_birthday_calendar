class OtherController < ApplicationController
  skip_before_action :require_login

  def home
    if @user = logged_in_user
      render(:personal_home)
    else
      render(:public_home)
    end
  end
end
