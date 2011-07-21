class UsersController < ApplicationController  
  filter_access_to :all
  helper_method :sort_column, :sort_direction
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @assignment = Assignment.create(:role_id => "3", :user_id => @user.id)
    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.save_without_session_maintenance
      @user.send_new_user_notification!
      @user.send_activation_instructions!
      flash[:notice] = "Your account has been created. Please check your email for activation instructions."
      redirect_to root_url      
    else
      flash[:notice] = "There was a problem creating your account."
      render :action => :new
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
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to user_path
    else
      render :action => :edit
    end
  end
  

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:success] = "User deleted"
      respond_to do |format|
        format.html { redirect_to(users_url) }
        format.xml  { head :ok }
        format.js
      end
    end  
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
  private
  
  def redisplay_roles
    respond_to do |format|
      format.html { redirect_to [:admin, @user]}
      format.js { render :redisplay_roles }
    end
  end

end