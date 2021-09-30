class PlaceRegionsController < ApplicationController
  def show
    id = params[:id]
    @place_region = PlaceRegion.find(id)
  end

  def new
    @place_region = PlaceRegion.new
  end

  def create
    @place_region = PlaceRegion.create(params.require(:place_region).permit(:name))
    if @place_region.persisted? then
      redirect_to root_path
    else
      render :new
    end
  end
end
