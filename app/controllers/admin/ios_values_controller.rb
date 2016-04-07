class Admin::IosValuesController < ApplicationController
  before_action :set_ios_values, only: [:update, :destroy, :show]
  helper_method :sort_column, :sort_direction
  filter_resource_access
  
  def index
    @title = 'iOS Calculation Values'
    @ios_values = IosValue.all
    @ios_values = IosValue.paginate(:page => params[:page])
  end

  def new
      @title = 'New iOS Calculation Values'
      @ios_value = IosValue.new
  end
  
  def create
    @ios_value = IosValue.create(ios_values_params)
      
    if @ios_value.save
      redirect_to ios_values_path, notice: 'New values were saved. These will affect all future quotes.'
    else
      render :new
    end
  end
  
  def destroy
    @ios_value.destroy
    redirect_to ios_values_path, notice: 'Quote Values deleted.'
  end
  
  def show
    @title = 'Values'
  end

  private

  def set_ios_values
    @ios_value = IosValue.find(params[:id])
  end

  def ios_values_params
    params.require(:ios_values).permit(:daily_rate, :iosdevice_support_cost, :iosdevice_install_time, :iosdevice_install_setup)
  end

end
