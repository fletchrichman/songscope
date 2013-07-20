class Artist < ActiveRecord::Base
#	attr_accessible :name, :hotness, :song_url

	validates_uniqueness_of :name

	belongs_to :region
	has_many :genres

	def find_song
		# search through soundcloud for that artists song
	end
	
end
