class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :post_id, presence: true

  after_create :increment_post_like_count

  def increment_post_like_count
    post.increment!(:like_count)
  end
end
