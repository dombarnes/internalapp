class Admin::IosValuesController < ApplicationController
  before_action :set_ios_values, only: [:update, :destroy, :show]
  helper_method :sort_column, :sort_direction
  filter_resource_access
  
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
      @ios_value = IosValue.create(ios_values_params)
      
      respond_to do |format|
        if @ios_value.save
          format.html { redirect_to( ios_values_path, :notice => 'New values were saved. These will affect all future quotes.') }
          format.xml  { render :xml => @ios_value, :status => :created, :location => @ios_value }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @ios_value.errors, :status => :unprocessable_entity }
        end
      end
  end
  
  def destroy
    @ios_value.destroy
    respond_to do |format|
      format.html {flash[:success] = "Quote Values deleted."
                  redirect_to ios_values_path }
      format.js
    end
  end
  
  def show
    @title = "Values"
  end

private
  def set_ios_values
    @ios_value = IosValue.find(params[:id])
  end

  def ios_values_params
    params.require(:ios_values).permit(:daily_rate, :iosdevice_support_cost, :iosdevice_install_time, :iosdevice_install_setup)
  end
end
