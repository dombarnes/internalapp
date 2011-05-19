class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :current_user_session, :current_user  
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
      redirect_back_or_default(root_path)
    # redirect_to root_path , :alert => exception.message
  end
  
  before_filter { |c| Authorization.current_user = c.current_user }
  filter_parameter_logging :password, :password_confirmation 

  protected
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    
    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def admin_user
      redirect_to(companies_path) unless current_user.role? :admin
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
   
   def permission_denied
     flash[:error] = "Sorry, you are not allowed to access that page"
     redirect_back_or_default(root_path)
   end 
end