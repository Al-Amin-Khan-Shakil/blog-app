class CreateUser < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.string :bio
      t.integer :postsCounter, default: 0

      t.timestamps
    end
  end
end
