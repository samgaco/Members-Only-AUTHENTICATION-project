class PostsController < ApplicationController

  before_action :sign_in, only: [:new, :create]


  def new
    @post = Post.new 
  end

  def index
  end

  def create 
    @post = Post.new(post_params.merge(user_id: @current_user.id))
   # @post.save 
    if @post.save
       flash[:success] = "Your post has been created"
       redirect_to posts_new_path
    else  
       flash[:warning] = "Something went wrong with your post!"
    end 

  end 

  private
  def sign_in 
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_url # halts request cycle
      end 
  end 

  def post_params 
    params.require(:post).permit(:title, :content, :author)
  end 
end
