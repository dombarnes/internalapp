class PeopleController < ApplicationController
  before_action :set_person, only: [:edit, :update, :destroy, :show, :correct_user]
  helper_method :sort_column, :sort_direction
  filter_resource_access
  
  def index
    @people = Person.all
    @title = "People"
  end

  def show
    @title = "People"
    @company = @person.company
  end

  def new
    @title = "People"
    @person = Person.new
  end

  def edit
    @title = "People"
  end

  def create
    @title = "People"
    @person = Person.new(person_params)
    if @person.save
      redirect_to @person, notice: 'The person was successfully created.'
    else
      render :new 
    end
  end

  def update
    @title = "People"
    if @person.update_attributes(person_params)
      redirect_to @person, notice: 'The person was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @title = "People"
    @person.destroy
    redirect_to peoples_path
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
