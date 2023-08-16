require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'Kelly Hughes', bio: 'Hello, this is my bio') }
  let(:post) { user.posts.create(title: 'Hello', content: 'Hello, this is my post') }

  describe 'GET /index' do
    it 'returns http success' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(:success)
      expect(response.request.fullpath).to eq("/users/#{user.id}/posts")
      expect(response.body).to include('All user posts')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(:success)
      expect(response.request.fullpath).to eq("/users/#{user.id}/posts/#{post.id}")
      expect(response.body).to include(post.content)
    end
  end
end
