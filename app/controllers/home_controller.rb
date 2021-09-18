class HomeController < ApplicationController
  def index
    @places = Place.all()
  end

  def details
    @places = Place.all()
  end
end
