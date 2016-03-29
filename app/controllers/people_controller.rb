class PeopleController < ApplicationController
  before_action :set_person, only: [:edit, :update, :destroy, :show, :correct_user]
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
    @company = @person.company
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
  end

  def create
    @title = "People"
    @person = Person.new(person_params)

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
    redirect_to(root_path) unless current_user?(@user)
  end
  
  def set_person
    @user = User.find(params[:id])
  end  

  def people_params
    params.require(:people).permit(:company_id, :title, :first_name, :last_name, :position, :telephone_number, :mobile_number, :email_address, :address_1, :address_2, :city, :county, :postcode, :im, :linkedin, :twitter)
  end
end
