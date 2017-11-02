class ApplicationController < ActionController::Base
  #, if: :storable_location?
  before_filter :logged_in?
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  @@name_path = nil
  
  def logged_in?
    current_uri = request.env['PATH_INFO']
    @@name_path = current_uri
    redirect_to login_path and return unless
      (@current_user = User.find_by_id(session[:user_id])).kind_of?(User)
  end
  
end