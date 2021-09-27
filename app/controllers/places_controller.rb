class PlacesController < ApplicationController
  def show
    id = params[:id]
    @places = Place.find(id)
  end

  def new
    @places = Place.new
  end

  def create
    @places = Place.create(params.require(:place).permit(:title, :description, :rooms, :bathrooms, :rent, :pets, :parking_slot))
    if @places.persisted? then
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
end
