class Tag < ApplicationRecord
  before_save :downcase_tag_name

  has_many :tag_maps, dependent: :destroy
  has_many :post_images, through: :tag_maps

  validates :tag_name, presence: true, uniqueness: true, length: { maximum: 50 }

  private

  def downcase_tag_name
    tag_name.downcase!
  end
end
