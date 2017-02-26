class CreateCommentToPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_to_photos do |t|
      t.text :photo_comment
      t.integer :user_id
      t.integer :photo_id
      t.timestamps
    end
    add_index :comment_to_photos,[:user_id, :photo_id]
    add_index :comment_to_photos, :photo_id
  end
end
