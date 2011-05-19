class ClientsController < ApplicationController
# before_filter :authenticate, :only => [:edit, :update, :show, :index]

#load_and_authorize_resource # For declarative authorization
#filter_resource_access

# before_filter :require_user, :only => [:edit, :update, :index, :destroy]
# before_filter :admin_user, :only => :destroy
helper_method :sort_column, :sort_direction
before_filter :correct_user, :only => [:edit, :update, :show, :index]

  def index
    @clients = Client.all
    @title = "Clients"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clients }
    end
    @clients = Client.paginate(:page => params[:page])
  end

  def show
    @client = Client.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @client }
    end
  end

  def new
    @client = Client.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client }
    end
  end


  def edit
    @client = Client.find(params[:id])
  end

  def create
   @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        format.html { redirect_to(@client, :notice => 'Client was successfully created.') }
        format.xml  { render :xml => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to(@client, :notice => 'Client was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    respond_to do |format|
      format.html { redirect_to(clients_url) }
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
