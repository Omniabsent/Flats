class PlaceReservation < ApplicationRecord
  belongs_to :place
  belongs_to :visitor
end
