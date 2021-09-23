class PlacesController < ApplicationController
  def show
    id = params[:id]
    @places = Place.find(id)
  end

  def new
    @places = Place.new
  end

  def create
    pl = Place.create(params.require(:place).permit(:title, :description, :rooms, :bathrooms, :rent, :pets, :parking_slot))
    redirect_to place_path(pl.id)
  end
end
