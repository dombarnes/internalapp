class AdhocSupportsController < ApplicationController
  before_action :set_adhoc_supports, only: [:edit, :update, :show, :destroy]
  helper_method :sort_column, :sort_direction
  filter_resource_access

  def index
    @adhoc_supports = AdhocSupport.all.order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    @title = 'Ad Hoc Support Contracts'
  end

  def show
  end

  def new
    @adhoc_support = AdhocSupport.new
  end

  def edit
  end

  def create
    @adhoc_support = AdhocSupport.new(adhoc_support_params)
    if @adhoc_support.save
      redirect_to @adhoc_support, notice: 'Ad-Hoc support was successfully created.'
    else
      render :new
    end
  end

  def update
    if @adhoc_support.update(adhoc_support_params)
      redirect_to @adhoc_support, notice: 'Ad-Hoc Entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @adhoc_support.destroy
    redirect_to adhoc_supports_path
  end

  private

  def set_adhoc_supports
    @adhoc_support = AdhocSupport.find(params[:id])
  end

  def adhoc_support_params
    params.require(:adhoc_support).permit(:date, :job_type, :technicians, :notes, :company_id)
  end

  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    redirect_to root_path unless current_user?(@user)
  end

  def sort_column
    AdhocSupport.column_names.include?(params[:sort]) ? params[:sort] : 'date'
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'desc'
  end
end
