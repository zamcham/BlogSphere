require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with a name' do
      user = User.new(name: 'John Doe')
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(name: nil)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is valid with a post_counter greater than or equal to 0' do
      user = User.new(name: 'John Doe', post_count: 0)
      expect(user).to be_valid
    end

    it 'is invalid with a negative post_counter' do
      user = User.new(name: 'John Doe', post_count: -1)
      expect(user).not_to be_valid
      expect(user.errors[:post_count]).to include('must be greater than or equal to 0')
    end
  end
end
