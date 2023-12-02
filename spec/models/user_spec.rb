require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Name 1', postsCounter: 0) }

  before { user.save }

  it 'shoud be valid' do
    expect(user).to be_valid
  end

  it 'name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'postsCounter should be integer' do
    user.postsCounter = 'a'
    expect(user).to_not be_valid
  end

  it 'returns most recent posts' do
    post1 = user.posts.create(title: 'post1', CommentsCounter: 0, LikesCounter: 0)
    post2 = user.posts.create(title: 'post2', CommentsCounter: 0, LikesCounter: 0)
    post3 = user.posts.create(title: 'post3', CommentsCounter: 0, LikesCounter: 0)

    expect(user.most_recent_posts).to eq([post3, post2, post1])
  end
end
