class MacValuesController < ApplicationController
  before_action :authenticate_user!
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
end
