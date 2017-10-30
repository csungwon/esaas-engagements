class SessionController < ApplicationController
  skip_before_action :logged_in?
  skip_before_action :verify_authenticity_token
  
  def create
    github_uid = request.env["omniauth.auth"]["info"]["nickname"]
    if (user = User.find_by_github_uid(github_uid))
      session[:user_id] = user.id
      if @@name_path == "orgs" 
        redirect_to orgs_path
      elsif @@name_path == "users"
       redirect_to users_path
      elsif @@name_path == "create"
        redirect_to creation_path
      else
        redirect_to apps_path
      end
    else
      flash[:alert] = "No user with GitHub name '#{github_uid}'."
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to login_path
  end

  def failure
    flash[:alert] = 'Authentication failed, please try again.'
    flash[:alert] += params[:message] if params[:message]
    redirect_to login_path
  end

  def login
  end

end
