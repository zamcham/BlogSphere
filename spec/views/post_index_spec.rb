require 'rails_helper'

RSpec.feature 'All user posts' do
  scenario 'I can see the user\'s profile picture' do
    user = User.create(name: 'Jack Johnson')
    post = user.create.posts(user: user, title: 'My Post', content: 'Content')

    visit user_posts_path(user)

    expect(page).to have_css('.userImg')
  end

  scenario 'I can see the user\'s username' do
    user = create(:user, name: 'Jack Johnson', photo: 'jack.jpg')
    post = create(:post, user: user, title: 'My Post')

    visit user_posts_path(user)

    expect(page).to have_content('Jack Johnson')
  end

  scenario 'I can see the number of posts the user has written' do
    user = create(:user, name: 'Jack Johnson', post_count: 5, photo: 'jack.jpg')
    create_list(:post, 5, user: user)

    visit user_posts_path(user)

    expect(page).to have_content('Number of posts: 5')
  end

  scenario 'I can see a post\'s title' do
    user = create(:user, name: 'Jack Johnson', photo: 'jack.jpg')
    post = create(:post, user: user, title: 'My Post')

    visit user_posts_path(user)

    expect(page).to have_content('My Post')
  end

  scenario 'I can see some of the post\'s body' do
    user = create(:user, name: 'Jack Johnson', photo: 'jack.jpg')
    post = create(:post, user: user, title: 'My Post', content: 'This is my post content')

    visit user_posts_path(user)

    expect(page).to have_content('This is my post content')
  end

  scenario 'I can see the first comments on a post' do
    user = create(:user, name: 'Jack Johnson', photo: 'jack.jpg')
    post = create(:post, user: user, title: 'My Post')
    comment1 = create(:comment, user: user, post: post, content: 'Comment 1')
    comment2 = create(:comment, user: user, post: post, content: 'Comment 2')

    visit user_posts_path(user)

    expect(page).to have_content('Comment 1')
    expect(page).to have_content('Comment 2')
  end

  scenario 'I can see how many comments a post has' do
    user = create(:user, name: 'Jack Johnson', photo: 'jack.jpg')
    post = create(:post, user: user, title: 'My Post')
    create_list(:comment, 3, post: post, user: user)

    visit user_posts_path(user)

    expect(page).to have_content('Comments: 3')
  end

  scenario 'I can see how many likes a post has' do
    user = create(:user, name: 'Jack Johnson', photo: 'jack.jpg')
    post = create(:post, user: user, title: 'My Post')
    create_list(:like, 2, post: post, user: user)

    visit user_posts_path(user)

    expect(page).to have_content('Likes: 2')
  end

  scenario 'I can see a section for pagination if there are more posts than fit on the view' do
    user = create(:user, name: 'Jack Johnson', photo: 'jack.jpg')
    create_list(:post, 10, user: user)

    visit user_posts_path(user)

    expect(page).to have_selector('.pagination')
  end

  scenario 'When I click on a post, it redirects me to that post\'s show page' do
    user = create(:user, name: 'Jack Johnson', photo: 'jack.jpg')
    post = create(:post, user: user, title: 'My Post')

    visit user_posts_path(user)
    click_link 'My Post'

    expect(current_path).to eq(user_post_path(user, post))
  end
end
