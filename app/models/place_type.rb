class PlaceType < ApplicationRecord
  has_many :place
  validates :name, presence: {message: 'não pode ficar em branco'}
end
