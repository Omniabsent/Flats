class PlaceType < ApplicationRecord
  has_many :place
  validates :name, presence: {message: 'tipo não pode ficar em branco'}
  validates :name, uniqueness: {message: 'tipo já existente'}
end
