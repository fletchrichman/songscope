class ArtistGenre < ActiveRecord::Base
	#artist_id, #genre_id
	belongs_to :artists, :polymorphic => true
	belongs_to :genres
end
