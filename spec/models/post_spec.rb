require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Kelly Hughes') }

  describe 'Post Validations' do
    it 'Valid post' do
      post = Post.new(title: 'My First Post', content: 'This is my first post', comment_count: 1, like_count: 5,
                      user_id: user.id)
      expect(post).to be_valid
    end

    it 'Invalid post, missing title' do
      post = Post.new(title: nil, content: 'This is my first post')
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'Invalid post, missing body' do
      post = Post.new(title: 'My First Post', content: nil)
      expect(post).not_to be_valid
      expect(post.errors[:content]).to include("can't be blank")
    end

    it 'Title exceeds max character count' do
      post = Post.new(title: 'a' * 251, content: 'This is my first post')
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
    end

    it 'Body exceeds max character count' do
      post = Post.new(title: 'My First Post', content: 'a' * 1001)
      expect(post).not_to be_valid
      expect(post.errors[:content]).to include('is too long (maximum is 1000 characters)')
    end

    it 'The comment count is greater than or equal to 0' do
      post = Post.new(title: 'My First Post', content: 'This is my first post', comment_count: 0, like_count: 5,
                      user_id: user.id)
      expect(post).to be_valid
    end

    it 'Invalid, the comment count is negative' do
      post = Post.new(title: 'My First Post', content: 'This is my first post', comment_count: -1, like_count: 5,
                      user_id: user.id)
      expect(post).not_to be_valid
      expect(post.errors[:comment_count]).to include('must be greater than or equal to 0')
    end
  end
end
