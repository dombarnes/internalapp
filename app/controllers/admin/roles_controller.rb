class Admin::RolesController < ApplicationController
before_filter :require_user
filter_access_to :admin

  def index
    @roles = Role.all
    @new_role = Role.new
  end

  def new
    @role = Role.new
  end
  
  def create
    Role.create params[:role]
    redisplay_roles
  end
  
  def destroy
    Role.find(params[:id]).destroy
    redisplay_roles
  end
  
private  
  def redisplay_roles
    respond_to do |format|
      format.html { redirect_to admin_roles_path }
      format.js {
        @roles = Role.all
        render :redisplay_roles
      }
    end
  end

end
