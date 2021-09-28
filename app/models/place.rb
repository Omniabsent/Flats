class Place < ApplicationRecord
  belongs_to :place_type

  validates :title, :description, :rooms, :bathrooms, :rent, presence: {message: 'não pode ficar em branco'}
end
