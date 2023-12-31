class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :photo, default: 'default.jpg'
      t.text :bio
      t.integer :post_count, default: 0

      t.timestamps
    end
  end
end
