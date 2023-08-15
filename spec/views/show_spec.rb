require 'rails_helper'

RSpec.feature 'User Profile and Posts' do
  scenario 'I can see the user\'s profile picture' do
    user = USser.create(name: 'John Doe', photo: 'user.jpg')

    visit user_path(user)

    expect(page).to have_css('.userImg')
  end

  scenario 'I can see the user\'s username' do
    user = create(:user, name: 'John Doe', photo: 'user.jpg')

    visit user_path(user)

    expect(page).to have_content('John Doe')
  end

  scenario 'I can see the number of posts the user has written' do
    user = create(:user, name: 'John Doe', post_count: 5, photo: 'user.jpg')

    visit user_path(user)

    expect(page).to have_content('Number of posts: 5')
  end

  scenario 'I can see the user\'s bio' do
    user = create(:user, name: 'John Doe', bio: 'I love coding!', photo: 'user.jpg')

    visit user_path(user)

    expect(page).to have_content('I love coding!')
  end

  scenario 'I can see the user\'s first 3 posts' do
    user = create(:user, name: 'John Doe', photo: 'user.jpg')
    create_list(:post, 5, user: user) # Create 5 posts for the user

    visit user_path(user)

    expect(page).to have_css('.user-post', count: 3)
  end

  scenario 'I can see a button to view all of a user\'s posts' do
    user = create(:user, name: 'John Doe', photo: 'user.jpg')

    visit user_path(user)

    expect(page).to have_link('All Posts', href: user_posts_path(user))
  end

  scenario 'When I click a user\'s post, it redirects me to that post\'s show page' do
    user = create(:user, name: 'John Doe', photo: 'user.jpg')
    post = create(:post, user: user, title: 'My Post')

    visit user_path(user)
    click_link 'My Post'

    expect(current_path).to eq(user_post_path(user, post))
  end

  scenario 'When I click to see all posts, it redirects me to the user\'s post index page' do
    user = create(:user, name: 'John Doe', photo: 'user.jpg')

    visit user_path(user)
    click_link 'All Posts'

    expect(current_path).to eq(user_posts_path(user))
  end
end
