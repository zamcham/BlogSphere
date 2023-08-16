class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :comment_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :like_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  default_scope -> { order(created_at: :desc) }
end
