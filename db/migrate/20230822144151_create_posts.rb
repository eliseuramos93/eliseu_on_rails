class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :title, null: false
      t.text :body, null: false
      t.text :tags, null: false, array: true, default: []

      t.timestamps
    end
  end
end
