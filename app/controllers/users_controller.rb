class UsersController < ApplicationController
  before_action :is_authenticated?, except: [:new]

  def index
  end

  def new
  end


  def create
     @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Hacker News! Please Log in :)"
      redirect_to root_path
    else
      render 'new'
    end
  end


  private

    def user_params
      params.require(:user).permit( :email, :password, :password_confirmation)
    end


end
