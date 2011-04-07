class InstallQuotesController < ApplicationController
  before_filter :authenticate
  before_filter :require_user
  
  def create
    @install_quotes = current_user.install_quotes.build(params[:install_quotes])
    if @install_quotes.save
      flash[:success] = "Quote saved!"
      redirect_to install_quotes_path
    else
      render 'home/index'
    end
  end
  
  def destroy
  end
end