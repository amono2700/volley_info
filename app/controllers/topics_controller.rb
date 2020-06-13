class TopicsController < ApplicationController

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def index
    @topics = Topic.all.page(params[:page])
    @topic = Topic.new
  end

  def destroy
    @topic.destroy
      redirect_to root_url
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
