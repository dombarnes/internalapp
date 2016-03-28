class UserSessionsController < ApplicationController

  def new
   @title = "Log In"
   @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      flash[:notice] = "You have been logged in"
      redirect_back_or_default root_url
    else
      # redirect_to new_user_sessions_path
      render 'new'
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to new_user_sessions_path
  end
  
private
  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
