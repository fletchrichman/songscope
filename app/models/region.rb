class Region < ActiveRecord::Base
	#attr_accessible :name 

	has_many :artists, :dependent => :destroy
	has_many :genres, through: :artists


	def pull_artists
		resp = self.GET_location_hot
		artists = resp.parsed_response["response"]["artists"]
		 
		artists.each do |artist|
			a = Artist.find_or_create_by_name(artist['name'])
			a.hotness = artist['hotttnesss'].to_i
			a.region_id = self.id
			a.save

			artist['genres'].each do |genre|
				g = Genre.find_or_create_by_name(genre['name'])
				g.artist_id = a.id
			end

		end

	end



 	def GET_location_hot
		HTTParty.get("http://developer.echonest.com/api/v4/artist/search?api_key=#{ENV['ECHONEST_KEY']}&format=json&artist_location=region:#{self.name}&limit=false&results=100&sort=hotttnesss-desc&bucket=genre&bucket=hotttnesss")
 	end

end