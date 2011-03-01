class CompaniesController < ApplicationController
before_filter :authenticate, :only => [:edit, :update, :show, :index]
# before_filter :correct_user, :only => [:edit, :update, :show, :index]

  def index
    @companies = Company.all
    @title = "Companies"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @company }
    end
    @companies = Company.paginate(:page => params[:page])
  end

  def show
    @company = Company.find(params[:id])

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
    @company = Company.new(params[:client])

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
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to(companies_url) }
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
