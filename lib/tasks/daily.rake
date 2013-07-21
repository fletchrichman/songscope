namespace :daily do

	desc 'Runs all the different updates'
	task :update => :environment do |t|

		Region.all.each do |region|
			region.pull_artists
			region.artists.each do |artist|
				artist.pull_songs
			end
			region.find_hotness
			region.find_keyword_genres
		end

	end
	
end