class TopicsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :authorize_owner!, only: [:edit, :update, :destroy]

  def index
    # シンプル検索 + 新しい順 + ページネーション
    @pagy, @topics = pagy(
      Topic.search(params[:q]).includes(:user).order(created_at: :desc)
    )
  end

  def show
    @comment = Comment.new
    @comments = @topic.comments.includes(:user).order(created_at: :asc)
  end

  def new
    @topic = current_user.topics.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      redirect_to @topic, notice: "投稿しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: "更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "削除しました。"
  end

  private
  def set_topic
    @topic = Topic.find(params[:id])
  end

  def authorize_owner!
    redirect_to @topic, alert: "編集権限がありません。" unless @topic.user == current_user
  end

  def topic_params
    params.require(:topic).permit(:title, :body, :image)
  end
end
