class Place < ApplicationRecord
  validates :title, :description, :rooms, :bathrooms, :rent, presence: {message: "não pode ficar em branco"}
end
