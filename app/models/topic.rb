class Topic < ApplicationRecord
  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 80 }
  validates :body,  presence: true

  # シンプル検索（DBに依存しない小ワザ）
  scope :search, ->(q) {
    if q.present?
      where("LOWER(title) LIKE ? OR LOWER(body) LIKE ?", "%#{q.downcase}%", "%#{q.downcase}%")
    else
      all
    end
  }
end
