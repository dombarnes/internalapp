class IosValuesController < ApplicationController
  before_filter :require_user
  helper_method :sort_column, :sort_direction
  filter_access_resource
  
  def index
    @title = "iOS Calculation Values"
    @ios_values = IosValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ios_values }
    end
    
    @ios_values = IosValue.paginate(:page => params[:page])
  end

  def new
      @title = "New iOS Calculation Values"
      @ios_value = IosValue.new      
  
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @ios_value }
      end
  end
  
  def create
      @ios_value = IosValue.new(params[:ios_value])
      
      respond_to do |format|
        if @ios_value.save
          format.html { redirect_to( :back, :notice => 'New values were saved. These will affect all future quotes.') }
          format.xml  { render :xml => @ios_value, :status => :created, :location => @ios_value }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @ios_value.errors, :status => :unprocessable_entity }
        end
      end
  end
  
  def show
    @title = "Values"
    @ios_value = IosValue.find(params[:id])
  end
  
private
  def authenticate
    deny_access unless signed_in?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end  

end