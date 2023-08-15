class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }

  after_create :increment_post_comment_count

  def increment_post_comment_count
    post.increment!(:comment_count)
  end
end
