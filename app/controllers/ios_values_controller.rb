class IosValuesController < ApplicationController
before_filter :require_user



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
  
  def edit
      @title = "Edit iOS Calculation Values"
      @ios_value = IosValue.find(params[:id])
  end
  
  def create
      @title = "New iOS Calculation Values"
      @ios_value = IosValue.new(params[:ios_value])
      
      respond_to do |format|
        if @ios_value.save
          format.html { redirect_to(@ios_value, :notice => 'Adhoc support was successfully created.') }
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
  
  
end