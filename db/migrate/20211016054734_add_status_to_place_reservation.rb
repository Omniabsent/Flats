class AddStatusToPlaceReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :place_reservations, :status, :integer, default: 0
  end
end
