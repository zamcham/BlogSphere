require 'rails_helper'

RSpec.feature 'All user posts' do
  scenario 'I can see the user\'s profile picture' do
    user = User.create(name: 'Jack Johnson')
    post = user.posts.create(user: user, title: 'My Post', content: 'This is my post content')
    visit user_posts_path(user.id)

    expect(page).to have_css('.userImg')
  end

  scenario 'I can see the user\'s username' do
    user = User.create(name: 'Jack Johnson')
    post = user.posts.create(user: user, title: 'My Post', content: 'This is my post content')
    visit user_posts_path(user.id)

    expect(page).to have_content('Jack Johnson')
  end

  scenario 'I can see the number of posts the user has written' do
    user = User.create(name: 'Jack Johnson')
    post1 = user.posts.create(user: user, title: 'My Post', content: 'This is my post content')
    post2 = user.posts.create(user: user, title: 'My Post', content: 'This is my post content')
    post3 = user.posts.create(user: user, title: 'My Post', content: 'This is my post content')
    post4 = user.posts.create(user: user, title: 'My Post', content: 'This is my post content')
    post5 = user.posts.create(user: user, title: 'My Post', content: 'This is my post content')

    visit user_posts_path(user.id)

    expect(page).to have_content('Number of posts: 5')
  end

  scenario 'I can see a post\'s title' do
    user = User.create(name: 'Jack Johnson')
    post = user.posts.create(user: user, title: 'My Post', content: 'This is my post content')
    visit user_posts_path(user.id)

    expect(page).to have_content('My Post')
  end

  scenario 'I can see some of the post\'s body' do
    user = User.create(name: 'Jack Johnson')
    post = user.posts.create(user: user, title: 'My Post', content: 'This is my post content')
    visit user_posts_path(user.id)

    expect(page).to have_content('This is my post content')
  end

  scenario 'I can see the comments on a post' do
    user = User.create(name: 'Jack Johnson')
    post = user.posts.create(title: 'My Post', content: 'This is my post content')
    comment1 = post.comments.create(user: user, post: post, content: 'Comment 1')
    comment2 = post.comments.create(user: user, post: post, content: 'Comment 2')

    visit user_posts_path(user.id)

    expect(page).to have_content('Comment 1')
    expect(page).to have_content('Comment 2')
  end

  scenario 'I can see how many comments a post has' do
    user = User.create(name: 'Jack Johnson')
    post = user.posts.create(user: user, title: 'My Post', content: 'This is my post content')
    comment1 = post.comments.create(user: user, post: post, content: 'Comment 1')
    visit user_posts_path(user.id)


    expect(page).to have_content('Comments: 1')
  end

  scenario 'I can see how many likes a post has' do
    user = User.create(name: 'Jack Johnson')
    post = user.posts.create(user: user, title: 'My Post', content: 'This is my post content')
    like = post.likes.create(user: user, post: post)
    visit user_posts_path(user.id)



    expect(page).to have_content('Likes: 1')
  end

  scenario 'When I click on a post, it redirects me to that post\'s show page' do
    user = User.create(name: 'Jack Johnson')
    post = user.posts.create(user: user, title: 'My Post', content: 'This is my post content')
    visit user_posts_path(user.id)
    click_link 'My Post'

    expect(current_path).to eq(user_post_path(user, post))
  end
end
