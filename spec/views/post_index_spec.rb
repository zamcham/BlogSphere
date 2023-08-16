require 'rails_helper'

RSpec.feature 'All user posts' do
  before do
    @user = User.create(name: 'Jack Johnson')
    @post = @user.posts.create(title: 'My Post', content: 'This is my post content')
    @post.comments.create(user: @user, content: 'Comment 1')
  end

  scenario 'I can see the user\'s profile picture' do
    visit user_posts_path(@user)

    expect(page).to have_css('.userImg')
  end

  scenario 'I can see the user\'s username' do
    visit user_posts_path(@user)

    expect(page).to have_content('Jack Johnson')
  end

  scenario 'I can see the number of posts the user has written' do
    visit user_posts_path(@user)

    expect(page).to have_content('Number of posts: 1')
  end

  scenario 'I can see a post\'s title' do
    visit user_posts_path(@user)

    expect(page).to have_content('My Post')
  end

  scenario 'I can see some of the post\'s body' do
    visit user_posts_path(@user)

    expect(page).to have_content('This is my post content')
  end

  scenario 'When I click on a post, it redirects me to that post\'s show page' do
    visit user_posts_path(@user)
    click_link 'My Post'

    expect(current_path).to eq(user_post_path(@user, @post))
  end
end
