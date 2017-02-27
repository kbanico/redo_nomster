class AddPlaceIdToCommentToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :comment_to_photos, :place_id, :integer
  end
end
