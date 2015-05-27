class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  # before_filter :correct_user, :only => [:edit, :update, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @assignment = Assignment.create(:role_id => Role.find_by_name("user").id, :user_id => @user.id)
    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.save_without_session_maintenance
      @user.send_new_user_notification!
      @user.send_activation_instructions!
      format.html { redirect_to root_url, notice: 'Your account has been created. Please check your email for activation instructions.' }
      format.json { render action: 'show', status: :created, location: @staff }
    else
      format.html { render action: 'new' }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  def activate
    @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
    raise Exception if @user.active?
    if @user.activate!
      UserSession.create(@user, false)
      @user.send_activation_confirmation!
      redirect_to root_path
    else
      render :action => :new
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

private
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:login, :email, :first_name, :company_name, :job_title)
    end
end
