require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Kelly Hughes') }
  let(:post) do
    Post.create(title: 'My First Post', content: 'This is my first post', like_count: 0, comment_count: 0,
                user_id: user.id)
  end

  describe 'Like Validations' do
    it 'Valid like' do
      like = Like.new(user_id: user.id, post_id: post.id)
      expect(like).to be_valid
    end

    it 'Invalid like, missing user_id' do
      like = Like.new(user_id: nil, post_id: post.id)
      expect(like).not_to be_valid
      expect(like.errors[:user_id]).to include("can't be blank")
    end

    it 'Invalid like, missing post_id' do
      like = Like.new(user_id: user.id, post_id: nil)
      expect(like).not_to be_valid
      expect(like.errors[:post_id]).to include("can't be blank")
    end
  end
end
