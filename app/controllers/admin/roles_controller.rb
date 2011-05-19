class Admin::RolesController < ApplicationController
  def index
    @roles = Role.all
    @new_role = Role.new
  end

  def create
    Role.create params[:role]
    redisplay_roles
  end
  
  def destroy
    Role.find(params[:id]).destroy
    redirect_to admin_roles_path
  end
  
  private
  def redisplay_roles
    redirect_to admin_roles_path    
  end
end
