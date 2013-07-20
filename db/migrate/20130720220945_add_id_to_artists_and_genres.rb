class AddIdToArtistsAndGenres < ActiveRecord::Migration
  def change
  	add_column :artists, :region_id, :integer
  	add_column :genres, :artist_id, :integer
  end
end
