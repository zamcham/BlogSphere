require 'rails_helper'

RSpec.feature 'Viewing users on home page' do
  scenario 'I can see the username of all other users' do
    User.create(name: 'User1')
    User.create(name: 'User2')

    visit root_path

    expect(page).to have_content('User1')
    expect(page).to have_content('User2')
  end

  scenario 'I can see the profile picture for each user' do
    User.create(name: 'User1')
    User.create(name: 'User2')

    visit root_path

    expect(page).to have_css('.userImg', count: 2)
  end

  scenario 'I can see the number of posts each user has written' do
    User.create(name: 'User1', post_count: 5)
    User.create(name: 'User2', post_count: 10)

    visit root_path

    expect(page).to have_content('Number of posts: 5', count: 1)
    expect(page).to have_content('Number of posts: 10', count: 1)
  end

  scenario 'When I click on a user, I am redirected to that user\'s show page' do
    user = User.create(name: 'User1')

    visit root_path

    click_link 'User1'

    expect(current_path).to eq(user_path(user))
  end
end
