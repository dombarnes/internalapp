class Admin::MacValuesController < ApplicationController
  before_action :set_mac_values, only: [:edit, :update, :show, :destroy]
  helper_method :sort_column, :sort_direction
  filter_resource_access
    
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
    
  def create
      @mac_value = MacValue.create!(params[:mac_value])

      respond_to do |format|
        if @mac_value.save
          format.html { redirect_to( mac_values_path, :notice => 'Quotation Values Saved.') }
          format.xml  { render :xml => @mac_value, :status => :created, :location => @mac_value }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @mac_value.errors, :status => :unprocessable_entity }
        end
      end
  end
  
  def destroy
    @mac_value = MacValue.find(params[:id]).destroy
    respond_to do |format|
      format.html {flash[:success] = "Mac Quote Values deleted."
                  redirect_to mac_values_path }
      format.js
    end
  end
  
  def show
    @title = "Values"
    @mac_value = MacValue.find(params[:id])
  end

private
  def set_mac_values
    @mac_value = MacValue.find(params[:id])
  end

  def mac_values_params
    params.require(:mac_values).permit(:mac_install_time, :server_install_time, :new_user_setup_time, :ad_integration_time, :deploy_studio_setup_time, :print_server_time, :iwork_time, :office_time, :fce_time, :fcp_time, :ard_time, :logicx_time, :logicp_time, :cs5_time, :aperture_time, :documentation_time, :halfday_price, :day_rate, :mac_support_cost, :server_support_cost)
  end
end
