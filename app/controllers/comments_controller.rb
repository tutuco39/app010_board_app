class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new(comment_params.merge(user: current_user))
    if @comment.save
      redirect_to @topic, notice: "コメントしました。"
    else
      redirect_to @topic, alert: "コメントできませんでした。"
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to @topic, notice: "コメントを削除しました。"
    else
      redirect_to @topic, alert: "削除権限がありません。"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
