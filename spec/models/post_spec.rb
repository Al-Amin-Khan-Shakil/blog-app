require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) {User.create(name: 'user1', postsCounter: 0)}
  let(:post) { user.posts.create(title: 'title1', CommentsCounter: 0, LikesCounter: 0) }

  it 'should be valid post' do
    expect(post).to be_valid
  end

  it 'should be less than 250 char' do
    post.title = 'a' * 300
    expect(post).to_not be_valid
  end

  it 'title should be present' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'CommentsCounter should be integer' do 
    post.CommentsCounter = 'a'
    expect(post).to_not be_valid
  end

  it 'LikesCounter should be integer' do 
    post.LikesCounter = 'a'
    expect(post).to_not be_valid
  end

  it 'most recent comments' do
    c1 = post.comments.create(user_id: user.id, post_id: post.id)
    c2 = post.comments.create(user_id: user.id, post_id: post.id)
    c3 = post.comments.create(user_id: user.id, post_id: post.id)
    c4 = post.comments.create(user_id: user.id, post_id: post.id)
    c5 = post.comments.create(user_id: user.id, post_id: post.id)

    expect(post.most_recent_comments).to eq([c5,c4,c3,c2,c1])
  end

  it 'update the post counter' do
    post1 = user.posts.create(title: 'title1', CommentsCounter: 0, LikesCounter: 0)
    post2 = user.posts.create(title: 'title1', CommentsCounter: 0, LikesCounter: 0)
    user.reload
    expect(user.postsCounter).to eq 2
  end
end
