class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: :user_id, dependent: :destroy
  has_many :comments, foreign_key: :user_id, dependent: :destroy
  has_many :likes, foreign_key: :user_id, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  validates :name, presence: true, length: { maximum: 50 }
  validates :post_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def likes?(post)
    liked_posts.exists?(post.id)
  end

  def like_for(post)
    likes.find_by(post_id: post.id)
  end
end
