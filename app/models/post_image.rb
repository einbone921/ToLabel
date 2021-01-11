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
    tag_list.each do |tag|
      #受け取った値がDBに存在しない場合 ＝ find_tagにnilが代入 → 処理を実行
      unless find_tag = Tag.find_by(tag_name: tag.downcase)
        begin
          #createメソッドでタグの作成 & "!"で例外処理
          self.tags.create!(tag_name: tag)
          #例外が発生するとrescueが実行 → 値がnilになり、保存されずに次の処理へ
        rescue
          nil
        end
      # DBにタグが存在する場合 = 中間テーブルに投稿とタグのidを紐付け
      else
        TagMap.create!(post_image_id: self.id, tag_id: find_tag.id)
      end
    end
  end

  #---------------------------END----------------------------------

  validates :post_image, presence: true
  validates :caption, presence: true

  attachment :post_image
end
