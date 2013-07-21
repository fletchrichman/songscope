class Song < ActiveRecord::Base
	#attr accessible name, hotness, rdio_id, artist_id 

	validates_uniqueness_of :name

	belongs_to :artist
end
