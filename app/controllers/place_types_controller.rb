class PlaceTypesController < ApplicationController
  def show
    id = params[:id]
    @place_type = PlaceType.find(id)
  end

  def new
    @place_type = PlaceType.new
  end

  def create
    @place_type = PlaceType.create(params.require(:place_type).permit(:name))
    redirect_to root_path
  end
end
