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

  #postsコントローラで配列化した値を引数で受け取る
  def save_tags(tag_list)
    current_tags = self.tags.pluck(:tag_name)
    unless self.tags.nil?
      old_tags = current_tags - tags
      new_tags = tags - current_tags

      old_tags.each do |old_name|
        self.tags.delete
        Tag.find_by(tag_name:old_name)
      end

      new_tags.each do |new_name|
        post_image_tag = Tag.find_or_create_by(tag_name:new_name)
        self.tags << post_image_tag
      end
    end
  end
  #---------------------------END----------------------------------

  validates :post_image, presence: true
  validates :caption, presence: true

  attachment :post_image
end
