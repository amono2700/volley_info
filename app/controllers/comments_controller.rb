class CommentsController < ApplicationController

  def create
      @comment = current_user.comments.build(comment_params)
      if @comment.save
        redirect_to topic_path(@comment.topic_id)
      else
        render 'topics/show'
      end
  end

  def comment_params
      params.require(:comment).permit(:topic_id, :user_id, :content, :image)
  end
end
