class PlacesController < ApplicationController
  before_action :authenticate_place_owner!, only: [:new, :create]

  def show
    id = params[:id]
    @places = Place.find(id)
  end

  def new
    @places = Place.new
  end

  def create
    @places = Place.new(params.require(:place).permit(:title, :description, :rooms, :bathrooms, :rent, :pets, :parking_slot, :place_type_id, :place_region_id))
    @places.place_owner = current_place_owner
    if @places.save then
      redirect_to place_path(@places.id)
    else
      render :new
    end
  end

  def destroy
    id = params[:id]
    @places = Place.destroy(id)
    redirect_to root_path
  end

  def my_places
    @places = current_place_owner.place
  end
end
