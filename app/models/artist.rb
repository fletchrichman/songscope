class Artist < ActiveRecord::Base
	attr_accessible :name, :hotness, :song_url

	belongs_to :region
	has_many :genres

	def find_song
		# search through soundcloud for that artists song
	end
	
end
