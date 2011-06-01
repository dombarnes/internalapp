class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

    def new
     @user_session = UserSession.new
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @user_session }
      end
    end

    def create
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        flash[:notice] = "Welcome " + @current_user.first_name
        redirect_back_or_default users_path(@current_user)
      else
        render :action => 'new'
      end
    end

    def destroy
      current_user_session.destroy
      flash[:notice] = "Logout successful!"
      redirect_back_or_default new_user_session_url
    end

end