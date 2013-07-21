class Region < ActiveRecord::Base
	#attr_accessible :name, image_link, hotness, genre_overall	

	has_many :artists, :dependent => :destroy


	def pull_artists
		resp = self.GET_location_hot
		resp = self.GET_location_hot_backup if resp.parsed_response["response"]["artists"].empty? 
		if artists = resp.parsed_response["response"]["artists"]
		 
			artists.each do |artist|
				a = Artist.find_or_create_by(name: artist['name'])
				a.hotness = artist['hotttnesss']
				a.region_id = self.id
				artist["foreign_ids"].first["foreign_id"].slice!("rdio-US:artist:")
				a.song_url = artist["foreign_ids"].first["foreign_id"]
				a.save

				artist['genres'].each do |genre|
					g = Genre.find_or_create_by(name: genre['name'])
					ArtistGenre.find_or_create_by(artist_id: a.id, genre_id: g.id)
				end

			end

		end

	end

	def find_hotness
		artist_hotness = 0
		song_hotness = 0 
		song_count = 0
		artist_count = 0 
		self.artists.each do |artist|
			artist_count += 1
			artist_hotness += artist.hotness
			if artist.song
				song_count += 1
				song_hotness += artist.song.hotness
			end
		end
		if song_count > 0 && artist_count > 0 
			total_hotness = song_hotness/song_count + artist_hotness/artist_count
			self.hotness = total_hotness*100
			self.save
		end
	end

	def find_keyword_genres
		genre_string = ""
		self.artists.each do |artist|
			artist.artist_genres.each do |artist_genre|
				genre = Genre.find(artist_genre.genre_id)
				genre_string += genre.name + ", "
			end
		end
		resp = AlchemyAPI.search(:keyword_extraction, :text => genre_string)
		if resp.size > 0 
			self.genre_overall = resp.first["text"]
			self.save
		end
	end



 	def GET_location_hot
		HTTParty.get("http://developer.echonest.com/api/v4/artist/search?api_key=#{ENV['ECHONEST_KEY']}&format=json&artist_location=region:#{URI.encode( self.name )}&limit=true&results=100&sort=hotttnesss-desc&bucket=genre&bucket=hotttnesss&bucket=id:rdio-US")
 	end

 	def GET_location_hot_backup
		HTTParty.get("http://developer.echonest.com/api/v4/artist/search?api_key=#{ENV['ECHONEST_KEY']}&format=json&artist_location=#{URI.encode( self.name )}&limit=true&results=100&sort=hotttnesss-desc&bucket=genre&bucket=hotttnesss&bucket=id:rdio-US")
 	end

end