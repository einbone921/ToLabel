class PostImage < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy

  #------------いいね機能の実装処理--------------
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  #--------------------END------------------------

  #----------------タグ機能の実装処理---------------------------------
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  def save_tags(save_post_image_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - save_post_image_tags
    new_tags = save_post_image_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name: old_name)
    end

    new_tags.each do |new_name|
      post_image_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << post_image_tag
    end
  end
  #---------------------------END----------------------------------

  #-------------google mapsによる地図表示の実装--------------------
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  #---------------------------END----------------------------------
  validates :post_image, presence: true
  validates :caption, presence: true

  attachment :post_image
end
