class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_create :update_post_likes_counter

  private

  def update_post_likes_counter
    post.update(LikesCounter: post.likes.count)
  end
end
