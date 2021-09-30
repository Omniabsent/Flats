class PlaceRegion < ApplicationRecord
  has_many :place
  validates :name, presence: {message: 'região não pode ficar em branco'}
  validates :name, uniqueness: {message: 'região já existente'}
end
