class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :comment_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :like_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :increment_user_post_count

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_user_post_count
    user.increment!(:post_count)
  end
end
