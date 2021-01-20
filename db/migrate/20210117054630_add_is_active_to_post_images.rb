class AddIsActiveToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :is_active, :boolean, default: true, null: false
  end
end
