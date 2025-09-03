class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :topics, dependent: :nullify

  has_many :likes, dependent: :destroy
  has_many :liked_topics, through: :likes, source: :topic

  has_many :comments, dependent: :nullify
  has_many :comment_likes, dependent: :destroy
    


end
