class CommentLikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment

  def create
    @comment.comment_likes.find_or_create_by!(user: current_user)
    respond_to do |f|
      f.turbo_stream
      f.html { redirect_to @comment.topic }
    end
  end

  def destroy
    @comment.comment_likes.where(user: current_user).destroy_all
    respond_to do |f|
      f.turbo_stream
      f.html { redirect_to @comment.topic }
    end
  end

  private
  def set_comment; @comment = Comment.find(params[:comment_id]); end
end
