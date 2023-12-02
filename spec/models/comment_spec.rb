require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'name1', postsCounter: 0) }
  let(:post) { user.posts.create(title: 'title', CommentsCounter: 0, LikesCounter: 0) }

  it 'should update posts comment counter' do
    post.comments.create(user_id: user.id, post_id: post.id)
    post.comments.create(user_id: user.id, post_id: post.id)
    post.comments.create(user_id: user.id, post_id: post.id)
    post.comments.create(user_id: user.id, post_id: post.id)
    post.comments.create(user_id: user.id, post_id: post.id)

    post.reload

    expect(post.CommentsCounter).to eq 5
  end
end
