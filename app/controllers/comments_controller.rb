class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end


  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @current_user
    @comment = @post.comments.create(comment_params)
    @current_user.comments << @comment
    redirect_to post_comments_path(@post)
  end






  private
  def comment_params
    params.require(:comment).permit(:body)
  end


end
