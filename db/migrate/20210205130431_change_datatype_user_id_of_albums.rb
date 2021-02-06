class ChangeDatatypeUserIdOfAlbums < ActiveRecord::Migration[5.2]
  def change
    change_column :albums, :user_id, :integer, null: false
  end
end
