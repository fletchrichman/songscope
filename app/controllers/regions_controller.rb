class RegionsController < ApplicationController

	def index
		@regions = Region.order("hotness DESC")
	end

	def show
		@region = Region.find(params[:id])
		@artists = @region.artists
	end

	def create
    @region = Region.new(name: params[:region])

    if @region.save
			redirect_to edit_region_path (@region.id ) , notice: 'Region created!' 
    else
      redirect_to :back, notice: 'Something did not work sorry'
  	end
  end

  def edit
  	@region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])
    @region.name = params[:region]["name"]
    @region.image_link = params[:region]["image_link"]
    if @region.save
      redirect_to regions_path
    else
      redirect_to :back, notice: 'Something did not work sorry'
    end
  end

end
