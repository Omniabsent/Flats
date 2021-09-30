class HomeController < ApplicationController
  def index
    @places = Place.all()
    @place_type = PlaceType.all()
    @place_region = PlaceRegion.all()
  end
end
