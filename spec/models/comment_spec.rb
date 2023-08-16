require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Kelly Hughes') }
  let(:post) do
    Post.create(title: 'My First Post', content: 'This is my first post', like_count: 0, comment_count: 0,
                user_id: user.id)
  end

  describe 'Comment Validations' do
    it 'Valid comment' do
      comment = Comment.new(user_id: user.id, post_id: post.id, content: 'This is my first comment')
      expect(comment).to be_valid
    end

    it 'Invalid comment, missing user_id' do
      comment = Comment.new(user_id: nil, post_id: post.id, content: 'This is my first comment')
      expect(comment).not_to be_valid
      expect(comment.errors[:user_id]).to include("can't be blank")
    end

    it 'Invalid comment, missing post_id' do
      comment = Comment.new(user_id: user.id, post_id: nil, content: 'This is my first comment')
      expect(comment).not_to be_valid
      expect(comment.errors[:post_id]).to include("can't be blank")
    end

    it 'Invalid comment, missing content' do
      comment = Comment.new(user_id: user.id, post_id: post.id, content: nil)
      expect(comment).not_to be_valid
      expect(comment.errors[:content]).to include("can't be blank")
    end

    it 'Content exceeds max character count' do
      comment = Comment.new(user_id: user.id, post_id: post.id, content: 'a' * 1001)
      expect(comment).not_to be_valid
      expect(comment.errors[:content]).to include('is too long (maximum is 1000 characters)')
    end
  end
end
