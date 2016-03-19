class UsersController < ApplicationController
  before_action :set_user,       only: [:edit, :update, :destroy, :index]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy ]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  helper_method :sort_column, :sort_direction
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_new_user_notification!
      @user.send_activation_instructions!
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @title = "My Profile"
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to users_path, notice: "Account updated!"}
        format.json { render action: 'show', status: :created, location: @user}
      else
        format.html { render action: 'new' }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
        @title = "Edit User"
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.   
  def user_params     
    params.require(:user).permit(:email, :first_name, :last_name, :company_name, :job_title, :password, :password_confirmation)
  end

  def redisplay_roles
    respond_to do |format|
      format.html { redirect_to [:admin, @user]}
      format.js { render :redisplay_roles }
    end
  end

  def correct_user
    set_user
    redirect_to(root_path) unless current_user
  end
end
