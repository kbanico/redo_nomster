class AddCaptionToPhoto < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :caption, :text
    add_column :photos, :picture, :string

  end
end
