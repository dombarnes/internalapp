class UserSessionsController < ApplicationController

  def new
   @title = "Log In"
   @user_session = UserSession.new
  end

  def create
    @user = current_user
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      #flash[:notice] = "Welcome"
      redirect_back_or_default root_url
    else
      render 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    # current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to root_url
  end
  
  private
  def user_session_params
    params.require(:user_session).permit(:username, :password)
  end
end
