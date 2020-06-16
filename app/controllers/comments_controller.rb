class CommentsController < ApplicationController
  include ApplicationHelper
  before_action :logged_in?, only: [:create]

  def create
      @comment = current_user.comments.build(comment_params)
      if @comment.save
        redirect_to topic_path(@comment.topic_id)
      else
        render 'topics/show'
      end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to topic_url(@comment.topic_id)
    flash[:notice] = "コメントを削除しました"
  end

private
  def comment_params
      params.require(:comment).permit(:topic_id, :user_id, :content, :image)
  end


end
