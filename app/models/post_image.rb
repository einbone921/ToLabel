class PostImage < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  attachment :post_image

  validates :post_image_id, presence: true
  validates :caption, presence: true

end
