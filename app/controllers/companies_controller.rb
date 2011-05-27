class CompaniesController < ApplicationController
before_filter :require_user, :only => [:create, :new, :edit, :update, :index]
before_filter :admin_user, :only => :destroy
helper_method :sort_column, :sort_direction

  def index
    @companies = Company.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])
    @title = "Companies"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companies }
    end
  end

  def show
    @company = Company.find(params[:id])
    @title = @company.company_name
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @company }
    end
  end

  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company }
    end
  end

  def edit
    @company = Company.find(params[:id])
    @title = "Edit Company"
  end

  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to(@company, :notice => 'Company was successfully saved.') }
        format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to(@company, :notice => 'Company was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    Company.find(params[:id]).destroy
    flash[:notice] = "#{company.company_name} has been deleted"
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
    Company.column_names.include?(params[:sort]) ? params[:sort] : "company_name"
  end

  def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end