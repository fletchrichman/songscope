class CreateArtistGenres < ActiveRecord::Migration
  def change
    create_table :artist_genres do |t|
    	t.string :genre_id
    	t.string :artist_id
    	
      t.timestamps
    end
  end
end
