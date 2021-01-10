class PostImage < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :post_image

  validates :post_image_id, presence: true
  validates :caption, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
