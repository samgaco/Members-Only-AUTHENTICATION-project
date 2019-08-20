# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :sign_in, only: %i[new create]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Your post has been created'
      redirect_to root_path
    else
      flash[:warning] = 'Something went wrong with your post!'
    end
  end

  private

  def sign_in
    unless logged_in?
      flash[:error] = 'You must be logged in to access this section'
      redirect_to root_url # halts request cycle
      end
  end

  def post_params
    params.require(:post).permit(:title, :content, :author)
  end
end
