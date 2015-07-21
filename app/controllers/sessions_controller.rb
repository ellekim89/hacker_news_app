class SessionsController < ApplicationController

  before_action :is_authenticated?, except: [:new, :create]
  def new

  end

  def create
    #render plain: "create session"
    user =User.authenticate(params[:user][:email], params[:user][:password])
    if user
      session[:user_id] = user.id
      flash[:success] = 'You are logged in.'
      redirect_to posts_path

    else

      flash[:danger] = 'Invalid email and/or password.'

      redirect_to login_path
    end
  end



  def destroy

    # render plain: "destroy session"

    session[:user_id] = nil
    flash[:info] = "You are now logged out."
    redirect_to login_path
  end



end
