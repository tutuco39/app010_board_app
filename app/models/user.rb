class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :topics, dependent: :nullify
  has_many :comments, dependent: :nullify
end
