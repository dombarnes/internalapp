class ActivationsController < ApplicationController
  # before_filter :require_no_user, :only => [:new, :create]

  def new
        @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
        raise Exception if @user.active?
      end


  def create
    @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
    raise Exception if @user.active?

    if @user.activate!
      flash[:notice] = "Your account has been activated!"
      UserSession.create(@user, false) # Log user in manually
      @user.deliver_welcome!
      redirect_to root_url
    else
      render :action => :new
    end
  end
end

def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user 
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
