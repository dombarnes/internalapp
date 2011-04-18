class InstallQuotesController < ApplicationController
  load_and_authorize_resource # For declarative authorization
  filter_resource_access

  before_filter :require_user, :only => [:edit, :update, :index, :destroy]
  before_filter :admin_user, :only => :destroy
  helper_method :sort_column, :sort_direction
  
  def create
    @install_quotes = current_user.install_quotes.build(params[:install_quotes])
    if @install_quotes.save
      flash[:success] = "Quote saved!"
      redirect_to install_quotes_path
    else
      render 'home/index'
    end
  end
  
  def destroy
  end
end