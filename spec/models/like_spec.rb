require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'name1', postsCounter: 0) }
  let(:post) { user.posts.create(title: 'title', CommentsCounter: 0, LikesCounter: 0) }

  it 'should update post likes counter' do
    post.likes.create(user_id: user.id, post_id: post.id)
    post.likes.create(user_id: user.id, post_id: post.id)
    post.likes.create(user_id: user.id, post_id: post.id)
    post.likes.create(user_id: user.id, post_id: post.id)
    post.likes.create(user_id: user.id, post_id: post.id)

    post.reload

    expect(post.LikesCounter).to eq 5
  end
end
