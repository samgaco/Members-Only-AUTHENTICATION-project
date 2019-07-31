class PostsController < ApplicationController

  before_action :sign_in, only: [:new, :create]


  def new
    @post = Post.new 
  end

  def index
  end

  def create 
  end 

  private
  def sign_in 
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_url # halts request cycle
      end 
  end 
end
