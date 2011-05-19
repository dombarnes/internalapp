class AdhocSupportsController < ApplicationController
# before_filter :authenticate, :only => [:edit, :update, :show, :index]
# before_filter :correct_user, :only => [:edit, :update, :show, :index]
# load_and_authorize_resource # For declarative authorization
# filter_resource_access

before_filter :require_user, :only => [:edit, :update, :index, :destroy]
before_filter :admin_user, :only => :destroy
helper_method :sort_column, :sort_direction

  def index
    @adhoc_supports = AdhocSupport.all
    @title = "Ad Hoc Support Contracts"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @adhoc_supports }
    end
    @adhoc_supports= AdhocSupport.paginate(:page => params[:page])
  end

  def show
#    @adhoc_support = AdhocSupport.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @adhoc_support }
    end
  end

  def new
    @adhoc_support = AdhocSupport.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @adhoc_support }
    end
  end

  def edit
#    @adhoc_support = AdhocSupport.find(params[:id])
  end

  def create
    @adhoc_support = AdhocSupport.new(params[:adhoc_support])

    respond_to do |format|
      if @adhoc_support.save
        format.html { redirect_to(@adhoc_support, :notice => 'Adhoc support was successfully created.') }
        format.xml  { render :xml => @adhoc_support, :status => :created, :location => @adhoc_support }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @adhoc_support.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
#    @adhoc_support = AdhocSupport.find(params[:id])

    respond_to do |format|
      if @adhoc_support.update_attributes(params[:adhoc_support])
        format.html { redirect_to(@adhoc_support, :notice => 'Adhoc support was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @adhoc_support.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
#    @adhoc_support = AdhocSupport.find(params[:id])
    @adhoc_support.destroy

    respond_to do |format|
      format.html { redirect_to(adhoc_supports_url) }
      format.xml  { head :ok }
    end
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
