class User < ApplicationRecord
  has_many :posts, foreign_key: :user_id, dependent: :destroy
  has_many :comments, foreign_key: :user_id, dependent: :destroy
  has_many :likes, foreign_key: :user_id, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :post_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
