class PasswordResetsController < ApplicationController  
  before_action :set_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  before_filter :require_no_user

  def new  
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:info] = "Instructions to reset your password have been emailed to you.\nPlease check your email."
      redirect_to root_path
    else
      flash.now[:error] = "No user was found with email address #{params[:email]}"
      render action: :new
    end
  end

  def edit  
  end  
  
  def update
    @user.password = params[:password]
    # Only if your are using password confirmation
    # @user.password_confirmation = params[:password]

    # Use @user.save_without_session_maintenance instead if you
    # don't want the user to be signed in automatically.
    if @user.update_attributes(password_reset_params)
      flash[:success] = "Your password was successfully updated"
      redirect_to @user
    else
      render :edit
    end
  end
    
private  
  def load_user_using_perishable_token  
    @user = User.find_using_perishable_token(params[:id])  
    unless @user  
      flash[:error] = "We're sorry, but we could not locate your account. " +  
      "If you are having issues try copying and pasting the URL " +  
      "from your email into your browser or restarting the " +  
      "reset password process."  
      redirect_to root_url  
    end  
  end

  def set_user
    # @user = User.find_by(email: params[:email])    
    @user = User.find_using_perishable_token(params[:id])
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
  
  def password_reset_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
