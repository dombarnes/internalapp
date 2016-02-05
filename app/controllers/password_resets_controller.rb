class PasswordResetsController < ApplicationController  
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  # before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  # before_filter :require_no_user

  def new  
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.deliver_password_reset_instructions!
      flash[:info] = "Instructions to reset your password have been emailed to you. " +
        "Please check your email."
      redirect_to root_url
    else
      flash[:notice] = "No user was found with that email address"
      render 'new'
    end
  end

  def edit  
  end  
  
  def update  
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
        log_in @user
    # @user.password = params[:user][:password]  
    # @user.password_confirmation = params[:user][:password_confirmation]  
      flash[:success] = "Password has been reset"  
      redirect_to account_url  
    else  
      render 'edit'
    end  
  end  
  
  private  

  def load_user_using_perishable_token  
    @user = User.find_using_perishable_token(params[:id])  
    unless @user  
      flash[:notice] = "We're sorry, but we could not locate your account. " +  
      "If you are having issues try copying and pasting the URL " +  
      "from your email into your browser or restarting the " +  
      "reset password process."  
      redirect_to root_url  
    end  
  end

  def get_user
    @user = User.find_by(email: params[:email])    
  end

  # Confirms a valid user.
  def valid_user
    unless (@user && @user.activated? &&
            @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  # Checks expiration of reset token.
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
