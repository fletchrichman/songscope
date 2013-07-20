class Region < ActiveRecord::Base
	attr_accessible :name 

	has_many :artists
	has_many :genres, through: :artists


	def pull_artists
		# perform search query in echo nest api 

		# parse through and find or create each artist

	end


end