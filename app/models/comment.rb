class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_create :update_post_comments_counter

  private

  def update_post_comments_counter
    post.update(CommentsCounter: post.comments.count)
  end
end
