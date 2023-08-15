require 'rails_helper'

RSpec.feature 'User posts' do
  scenario 'I can see the user\'s profile picture' do
    user = User.create(name: 'Jack Johnson')
    post = user.posts.create(user: user, title: 'My Post', content: 'This is my post content')
    visit user_posts_path(user.id, post.id)

    expect(page).to have_css('.userImg')
  end

  scenario 'I can see a post\'s title' do
    user = User.create(name: 'Jack Johnson')
    post = user.posts.create(title: 'My Post', content: 'This is my post content')
    visit user_posts_path(user.id, post.id)

    expect(page).to have_content('My Post')
  end

  scenario 'I can see the post\'s body' do
    user = User.create(name: 'Jack Johnson')
    post = user.posts.create(title: 'My Post', content: 'This is my post content')
    visit user_posts_path(user.id, post.id)

    expect(page).to have_content('This is my post content')
  end

  scenario 'I can see the first comments on a post' do
    user = User.create(name: 'Jack Johnson')
    post = user.posts.create(title: 'My Post', content: 'This is my post content')
    comment1 = post.comments.create(user: user, post: post, content: 'Comment 1')
    comment2 = post.comments.create(user: user, post: post, content: 'Comment 2')

    visit user_posts_path(user.id, post.id)

    expect(page).to have_content('Comment 1')
    expect(page).to have_content('Comment 2')
  end
end
