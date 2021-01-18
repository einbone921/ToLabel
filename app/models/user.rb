class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post

  # フォローする側からみた関係
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  # フォローされる側からみた関係
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  # 対象のユーザーがフォロー済み(passive_relationships)に含まれているか
  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  # ゲストログインの際のユーザーデータ作成
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  # 退会済みのユーザーでないか否かの確認
  def active_for_authentication?
    super && (self.delete_flag == false)
  end

  attachment :profile_image
end
