class PostImage < ApplicationRecord
  belongs_to :user
  attachment :post_image

  validates :post_image_id, presence: true
  validates :caption, presence: true
end
