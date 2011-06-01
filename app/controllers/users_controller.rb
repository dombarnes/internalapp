class UsersController < ApplicationController  
helper_method :sort_column, :sort_direction
before_filter :load_user, :except => [:index]  

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.save_without_session_maintenance
      @user.send_activation_instructions!      # new method in the User model
      flash[:notice] = "Registration successful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def activate
    @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
    raise Exception if @user.active?
    if @user.activate!
      UserSession.create(@user, false)
      @user.send_activation_confirmation!
      redirect_to account_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = User.find(params[:id])
	  @title = @user.first_name + " " + @user.last_name = " - User Profile"
  end

  def edit
    @user = current_user
    @role = current_user.role
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
  def add_role
    role = Role.find_by_name params[:role]
    @user.roles.push role if role
    redisplay_roles
  end
  
  def delete_role
    @user.roles.delete(Role.find params[:role])
    redisplay_roles
  end
  
  private
  
  def load_user
    @user = User.find params[:id]
  end
  
  def redisplay_roles
    respond_to do |format|
      format.html { redirect_to [:admin, @user]}
      format.js { render :redisplay_roles }
    end
  end
end