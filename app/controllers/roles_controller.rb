class RolesController < ApplicationController

private
  def find_user
    @user_id = params[:user_id]
        return(redirect_to(users_url)) unless @user_id
        @user = User.find(@user_id)
    end
end
