class PlaceReservation < ApplicationRecord
  belongs_to :place
  belongs_to :visitor

  validate :end_date_greater_than_start_date, :start_date_in_the_past #funcionando no teste mas não no server

  enum status: {pending: 0, accepted: 1, rejected: 2}




  private

  def end_date_greater_than_start_date
    if start_date >= end_date then
      errors.add(:end_date, 'deve ser maior que a data de início')
    end
  end

  def start_date_in_the_past
    if start_date < Date.today then
      errors.add(:start_date, 'deve ser maior que a data atual')
    end
  end
end
