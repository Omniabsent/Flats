class DetailsController < ApplicationController
  def show
    id = params[:id]
    @places = Place.find(id)
  end
end
