class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :content
      t.integer :like_count
      t.integer :comment_count

      t.timestamps
    end
  end
end
