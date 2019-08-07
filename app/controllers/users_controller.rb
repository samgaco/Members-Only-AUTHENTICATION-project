class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Your account has been created"
      redirect_to root_path
    else  
      flash[:warning] = "Something went wrong!"
      redirect_to root_path
    end 
  end 

  private 

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
