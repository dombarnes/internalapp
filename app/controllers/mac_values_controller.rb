class MacValuesController < ApplicationController
#  load_and_authorize_resource # For declarative authorization
  filter_resource_access

  before_filter :require_user, :only => [:edit, :update, :index, :destroy]
  before_filter :admin_user, :only => :destroy
  helper_method :sort_column, :sort_direction

  def index
    @title = "Mac Install and Support Values"
    @mac_values = MacValue.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mac_values }
    end
    @mac_values = MacValue.paginate(:page => params[:page])
  end

  def new
      @title = "New Mac Calculation Values"
      @mac_value = MacValue.new
      
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @mac_value }
      end
  end
  
  def edit
      @title = "Edit Mac Calculation Values"
      @mac_value = MacValue.find(params[:id])
  end
  
  def create
      @title = "New Mac Calculation Values"
      @mac_value = MacValue.new(params[:mac_value])
      
      respond_to do |format|
        if @mac_value.save
          format.html { redirect_to(@mac_value, :notice => 'Adhoc support was successfully created.') }
          format.xml  { render :xml => @mac_value, :status => :created, :location => @mac_value }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @mac_value.errors, :status => :unprocessable_entity }
        end
      end
  end
  
  def show
    @title = "Values"
    @mac_value = MacValue.find(params[:id])
  end
  
  
end