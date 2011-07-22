class PeopleController < ApplicationController
  before_filter :require_user
  helper_method :sort_column, :sort_direction
  filter_resource_access
  
  def index
    @people = Person.all
    @title = "People"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @person }
    end
    @people = Person.paginate(:page => params[:page])
  end

  def show
    @person = Person.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  def new
    @people = Person.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @people }
    end
  end

  def edit
    @people = Person.find(params[:id])
  end

  def create
   @people = Person.new(params[:people])

    respond_to do |format|
      if @people.save
        format.html { redirect_to(@people, :notice => 'The person was successfully created.') }
        format.xml  { render :xml => @people, :status => :created, :location => @people }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @people.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @people = Person.find(params[:id])

    respond_to do |format|
      if @people.update_attributes(params[:people])
        format.html { redirect_to(@people, :notice => 'The person was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @people.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @people = Person.find(params[:id])
    @people.destroy
    respond_to do |format|
      format.html { redirect_to(peoples_url) }
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
