require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { User.create(name: 'Kelly Hughes', bio: 'Hello, this is my bio') }

  describe 'GET /index' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
      expect(response.request.fullpath).to eq('/')
      expect(response.body).to include('Users and posts count')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
      expect(response.request.fullpath).to eq("/users/#{user.id}")
      expect(response.body).to include(user.bio)
    end
  end
end
