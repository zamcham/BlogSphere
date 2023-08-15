require 'rails_helper'

RSpec.feature 'User Profile and Posts' do
  let(:user) { User.create(name: 'John Doe', bio: 'I love coding!', post_count: 5) }

  before do
    visit user_path(user)
  end

  scenario 'I can see the user\'s profile picture' do
    expect(page).to have_css('.userImg')
  end

  scenario 'I can see the user\'s username' do
    expect(page).to have_content(user.name)
  end

  scenario 'I can see the number of posts the user has written' do
    expect(page).to have_content("Number of posts: #{user.post_count}")
  end

  scenario 'I can see the user\'s bio' do
    expect(page).to have_content(user.bio)
  end

  scenario 'I can see a button to view all of a user\'s posts' do
    expect(page).to have_link('All Posts', href: user_posts_path(user))
  end

  scenario 'When I click to see all posts, it redirects me to the user\'s post index page' do
    click_link 'All Posts'
    expect(current_path).to eq(user_posts_path(user))
  end
end
