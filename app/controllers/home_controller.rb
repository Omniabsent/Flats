class HomeController < ApplicationController
  def index
    @places = Place.all()
    @place_type = PlaceType.all()
  end
end
