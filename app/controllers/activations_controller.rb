class ActivationsController < ApplicationController
  before_filter :require_no_user, only: [:new, :create]
  helper_method :user_session

  def new
    @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
    raise Exception if @user.active?
  end

  def create
    @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
    raise Exception if @user.active?

    if @user.activate!
      flash[:notice] = 'Your account has been activated!'
      UserSession.create(@user, false) # Log user in manually
      @user.deliver_welcome!
      redirect_to root_url
    else
      flash[:error] = "Unable to activate your account."
      render 'new'
    end
  end

  def activate
    user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
    if user && !user.active? # && user.authenticated?(:activation, params[:id])
      user.activate
      log_in(user)
      flash[:success] = 'Account activated!'
      redirect_to profile_path
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end

end
