class SupportQuotesController < ApplicationController
#  load_and_authorize_resource # For declarative authorization
  filter_resource_access

  before_filter :require_user, :only => [:edit, :update, :index, :destroy]
  before_filter :admin_user, :only => :destroy
  helper_method :sort_column, :sort_direction


  def new 
    @title = "Support Quote"
  end
end