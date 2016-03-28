class PeopleController < ApplicationController
  helper_method :sort_column, :sort_direction
  filter_resource_access
  
  def index
    @people = Person.all
    @title = "People"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

  def show
        @title = "People"
    @person = Person.find(params[:id])
    @company = Person.find(params[:id]).company
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  def new
    @title = "People"
    @person = Person.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  def edit
    @title = "People"
    @person = Person.find(params[:id])
  end

  def create
    @title = "People"
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to(@person, :notice => 'The person was successfully created.') }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @title = "People"
    @person = Person.find(params[:id])
    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to(@person, :notice => 'The person was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @title = "People"
    @person = Person.find(params[:id])
    @person.destroy
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
