class AddAlbumIdToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :album_id, :integer
  end
end
