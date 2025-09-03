# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :comment_likes, dependent: :destroy
  def liked_by?(user) = user && comment_likes.exists?(user_id: user.id)
end



