class UserSessionsController < ApplicationController

    def new
     @title = "Log In"
     @user_session = UserSession.new(params[:user_session])
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @user_session }
      end
    end

    def create
      @user = current_user
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        #flash[:notice] = "Welcome"
        redirect_back_or_default root_url
      else
        render :action => 'new'
      end
    end

    def destroy
      current_user_session.destroy
      flash[:notice] = "Logout successful!"
      redirect_to root_url
    end

end