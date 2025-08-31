class Topic < ApplicationRecord
  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_one_attached :image
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 80 }
  validates :body,  presence: true


  def liked_by?(user)
    likes.exists?(user: user)
  end

  # シンプル検索（DBに依存しない小ワザ）
  scope :search, ->(q) {
    if q.present?
      where("LOWER(title) LIKE ? OR LOWER(body) LIKE ?", "%#{q.downcase}%", "%#{q.downcase}%")
    else
      all
    end
  }
end
