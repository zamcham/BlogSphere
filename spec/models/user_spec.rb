require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validations' do
    it 'Valid user name' do
      user = User.new(name: 'Kelly Hughes')
      expect(user).to be_valid
    end

    it 'Invalid user, missing name' do
      user = User.new(name: nil)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'Name exceeds max character count' do
      user = User.new(name: 'a' * 51)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include('is too long (maximum is 50 characters)')
    end

    it 'The post count is greater than or equal to 0' do
      user = User.new(name: 'Kelly Hughes', post_count: 0)
      expect(user).to be_valid
    end

    it 'Invalid, the post count is negative' do
      user = User.new(name: 'Kelly Hughes', post_count: -1)
      expect(user).not_to be_valid
      expect(user.errors[:post_count]).to include('must be greater than or equal to 0')
    end
  end
end
