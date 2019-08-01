class SessionsController < ApplicationController
  def index 
  end
  def new
    @user  = User.new
  end
  def create 

    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in(user)
      current_user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = "you are logged in"
      redirect_to root_url
      else
        flash.now[:danger] = "name or password is incorrect"
        render "new"
    end
  end
  def delete 
    log_out
    redirect_to root_url
  end

end
