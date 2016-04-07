class Admin::MacValuesController < ApplicationController
  before_action :set_mac_values, only: [:edit, :update, :show, :destroy]
  helper_method :sort_column, :sort_direction
  filter_resource_access
    
  def index
    @title = "Mac Install and Support Values"
    @mac_values = MacValue.all
    @mac_values = MacValue.paginate(page: params[:page])
  end

  def new
    @title = "New Mac Calculation Values"
    @mac_value = MacValue.new
  end
    
  def create
    @mac_value = MacValue.create(mac_values_params)

    if @mac_value.save
      redirect_to admin_mac_values_path, notice: 'Quote Values Saved. They will be used for all new quotes.'
    else
      render :new
    end
  end
  
  def destroy
    @mac_value.destroy
    redirect_to admin_mac_values_path, notice: 'Mac Quote Values deleted' 
  end
  
  def show
    @title = "Values"
  end

  private

  def set_mac_values
    @mac_value = MacValue.find(params[:id])
  end

  def mac_values_params
    params.require(:mac_values).permit(:mac_install_time, :server_install_time, :new_user_setup_time, :ad_integration_time, :deploy_studio_setup_time, :print_server_time, :iwork_time, :office_time, :fce_time, :fcp_time, :ard_time, :logicx_time, :logicp_time, :cs5_time, :aperture_time, :documentation_time, :halfday_price, :day_rate, :mac_support_cost, :server_support_cost)
  end

end
