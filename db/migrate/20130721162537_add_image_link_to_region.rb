class AddImageLinkToRegion < ActiveRecord::Migration
  def change
  	add_column :regions, :image_link, :string
  end
end
