class PlaceReservationsController < ApplicationController
  def show
    @place_reservation = PlaceReservation.find(params[:id])
  end

  def create
    @place_reservation = PlaceReservation.new(place_reservation_params)
    @place_reservation.user = current_user
    @place_reservation.place = Place.find(params[:place_id])
    @place_reservation.save!
    redirect_to @place_reservation
  end

  def place_reservation_params
    params.require(:place_reservation).permit(:start_date, :end_date, :guests, :place_id)
  end
end
