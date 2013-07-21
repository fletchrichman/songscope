class Artist < ActiveRecord::Base
#	attr_accessible :name, :hotness, :song_url

	validates_uniqueness_of :name

	belongs_to :region
	has_many :genres
	has_one :song

	def pull_songs
		resp = self.GET_songs_hot
		song = resp.parsed_response["response"]["songs"].first
		s = Song.find_or_create_by_name(song["title"])
		s.hotness = song["song_hotttnesss"]
		rdio_id_string = song["tracks"].first["foreign_id"]
		rdio_id_string.slice!("rdio-US:track:")
		s.rdio_id = rdio_id_string
		s.artist_id = self.id
		s.save
	end

	def GET_songs_hot
		HTTParty.get("http://developer.echonest.com/api/v4/song/search?api_key=#{ENV['ECHONEST_KEY']}&format=json&artist=#{URI.encode(self.name)}&limit=true&results=1&sort=song_hotttnesss-desc&bucket=song_hotttnesss&bucket=id:rdio-US&bucket=tracks")
 	end
	
end
