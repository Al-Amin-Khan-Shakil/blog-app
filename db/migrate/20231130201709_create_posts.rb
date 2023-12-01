class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :CommentsCounter
      t.integer :LikesCounter

      t.timestamps
    end
  end
end
