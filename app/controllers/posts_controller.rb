class PostsController < ApplicationController

  before_action :is_authenticated?

  def index
    @post = @current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @current_user.posts.create posts_params
    redirect_to posts_path
  end

private
  def posts_params
    params.require(:post).permit(:title,:link)

  end


end
