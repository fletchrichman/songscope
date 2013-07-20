class RegionsController < ApplicationController

	def index
		@regions = Region.all
	end

	def show
		@region = Region.find(params[:id])
		@artists = @region.artists
	end

end
