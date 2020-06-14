class PagesController < ApplicationController
  def home
    @topic = Topic.new
    @topics = Topic.all.page(params[:page])
  end


end
