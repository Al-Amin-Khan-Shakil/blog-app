require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  before(:each) do
    @user = User.create(name: 'user1', photo: 'userPoto', bio: 'test_bio1', postsCounter: 1)
    @post = Post.create(title: 'post1', text: 'text', author_id: @user.id, CommentsCounter: 3, LikesCounter: 1)
    @comment1 = Comment.create(text: 'this a comment1', user_id: @user.id, post_id: @post.id)
    @comment2 = Comment.create(text: 'this a comment2', user_id: @user.id, post_id: @post.id)
    @comment3 = Comment.create(text: 'this a comment3', user_id: @user.id, post_id: @post.id)
    @like = Like.create(user_id: @user.id, post_id: @post.id)

    visit user_post_path(@user, @post)
  end

  describe 'Post/index' do
    it 'See who wrote the post' do
      expect(page).to have_content(@user.name)
    end

    it 'See a post title.' do
      expect(page).to have_content(@post.title)
    end

    it 'See some of the post body.' do
      expect(page).to have_content(@post.text)
    end

    it 'See how many comments a post has.' do
      expect(page).to have_content(@post.CommentsCounter)
    end

    it 'See how many likes a post has.' do
      expect(page).to have_content(@post.LikesCounter)
    end

    it 'See the username of each commentor' do
      expect(page).to have_content(@comment1.user.name)
      expect(page).to have_content(@comment2.user.name)
    end

    it 'See the comment each commentor left' do
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
    end
  end
end