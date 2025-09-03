class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic

  def create
    @topic.likes.find_or_create_by!(user: current_user)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @topic }
    end
  end

  def destroy
    @topic.likes.where(user: current_user).destroy_all
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @topic }
    end
  end

  private
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
end
