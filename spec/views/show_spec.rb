require 'rails_helper'

RSpec.feature 'User Profile and Posts' do
  scenario 'I can see the user\'s profile picture' do
    user = User.create(name: 'John Doe')

    visit user_path(user)

    expect(page).to have_css('.userImg')
  end

  scenario 'I can see the user\'s username' do
    user = User.create(name: 'Jack Johnson')

    visit user_path(user)

    expect(page).to have_content('Jack Johnson')
  end

  scenario 'I can see the number of posts the user has written' do
    user = User.create(name: 'John Doe', post_count: 5)

    visit user_path(user)

    expect(page).to have_content('Number of posts: 5')
  end

  scenario 'I can see the user\'s bio' do
    user = User.create(name: 'John Doe', bio: 'I love coding!')

    visit user_path(user)

    expect(page).to have_content('I love coding!')
  end

  scenario 'I can see the user\'s first 3 posts' do
    user = User.create(name: 'John Doe')
    user.posts.create(user: user, title: 'My Post')

    visit user_path(user)

    expect(page).to have_css('user-post', count: 0)
  end

  scenario 'I can see a button to view all of a user\'s posts' do
    user = User.create(name: 'John Doe')

    visit user_path(user)

    expect(page).to have_link('All Posts', href: user_posts_path(user))
  end

  scenario 'When I click to see all posts, it redirects me to the user\'s post index page' do
    user = User.create(name: 'John Doe')

    visit user_path(user)
    click_link 'All Posts'

    expect(current_path).to eq(user_posts_path(user))
  end
end
