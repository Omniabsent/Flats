class PlaceTypeController < ApplicationController
  def show
    id = params[:id]
    @place_type = PlaceType.find(id)
  end
end
