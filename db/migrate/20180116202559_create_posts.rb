class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
