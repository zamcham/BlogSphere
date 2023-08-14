user1 = User.create!(name: "Jack Hughes", post_count: 0)
user1 = User.create!(name: "Kevin Heart", post_count: 5)
post1 = user1.posts.create!(title: "My first post", content: "This is my first post")