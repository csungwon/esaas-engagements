class UsersController < ApplicationController
  print " UUUUUU1 "
  
  def index
    print " Index User "
    @@name_path = "users"
    @users = User.all
  end

  def new
    print " New User "
    @user = User.new
    render 'user'
    
  end

  def edit
    print " Edit User "
    @user = User.find params[:id]
    render 'user'
  end

  def create
    print " Create User "
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User successfully created.'
    else
      render 'user'
    end
  end

  def update
    print " Update User "
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render 'user'
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.
      require(:user).
      permit(:name,:email,:preferred_contact,:github_uid)
  end


end

