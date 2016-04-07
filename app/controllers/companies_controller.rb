class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  filter_resource_access

  def index
    @companies = Company.search(params[:search], sort_column, sort_direction)
    @title = 'Companies'
  end

  def show
    @title = @company.company_name
    @people = Person.where(company_id: @company.id)
    @new_person = @company.people.create(company_id: @company.id)
    @adhoc_supports = AdhocSupport.where(company_id: @company.id)
  end

  def new
    @company = Company.new
  end

  def edit
    @title = 'Edit Company'
  end

  def create
    @company = Company.create(company_params)
    if @company.save
      redirect_to @company, notice: 'Company was successfully saved.'
    else
        flash[:notice] = 'Cannot save this company. Please check all required fields.'
        render :new
    end
  end

  def update
    if @company.update_attributes(params[:company])
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @company_name = Company.find(params[:id]).company_name
    @company = Company.find(params[:id])
    @company.destroy
    flash[:notice] = "#{@company_name} has been deleted"
    redirect_to companies_path
  end

  private

  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def sort_column
    Company.column_names.include?(params[:sort]) ? params[:sort] : 'company_name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'ASC'
  end
  
  def set_company
    @company = Company.find(params[:id])
  end
  
  def company_params
    params.require(:company).permit(:company_name, :address_1, :address_2, :city, 
    :county, :postcode, :website, :telephone_number, :source, :company_type)
  end
end
