class PlaceReservationsController < ApplicationController
  def new
    @place_reservation = PlaceReservation.new
  end

  def show
    @place_reservation = PlaceReservation.find(params[:id])
  end

  def accept
    @place_reservation = PlaceReservation.find(params[:id])
    @place_reservation.accepted!
    redirect_to @place_reservation.place
  end

  def create
    @place_reservation = PlaceReservation.new(place_reservation_params)
    @place_reservation.visitor = current_visitor
    @place_reservation.place = Place.find(params[:place_id])
    @place_reservation.save

    redirect_to root_path, notice: 'Pedido de reserva enviado' #deveria redirectar to place_reservations/show mas não funciona por algum motivo
  end

  private

  def place_reservation_params
    params.require(:place_reservation).permit(:start_date, :end_date, :guests, :place_id)
  end
end
