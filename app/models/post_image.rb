class PostImage < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :album, optional: true
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def save_tags(save_post_image_tags)
    current_tags = tags.pluck(:tag_name) unless tags.nil?
    old_tags = current_tags - save_post_image_tags
    new_tags = save_post_image_tags - current_tags

    old_tags.each do |old_name|
      tags.delete Tag.find_by(tag_name: old_name.downcase)
    end

    new_tags.each do |new_name|
      post_image_tag = Tag.find_or_create_by(tag_name: new_name.downcase)
      tags << post_image_tag
    end
  end

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :post_image, presence: true
  # validates :caption, presence: true

  attachment :post_image
end
