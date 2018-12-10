class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to favorites_index_path
    else
      render :new
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :topic_id)
  end
end
