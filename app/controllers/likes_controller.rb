class LikesController < ApplicationController
  before_action :logged_in?, only: [:create, :destroy]
  def create
    @like = current_user.likes.create(comment_id: params[:comment_id])
    redirect_back(fallback_location: topic_path(@like.comment.topic.id))
  end

  def destroy
    @likes = Likes.find_by(user_id: current_user.id, comment_id: params[:comment_id])
    @likes.destroy
    redirect_back(fallback_location: topic_path(@like.comment.topic.id))
  end
end
