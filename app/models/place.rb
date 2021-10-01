class Place < ApplicationRecord
  belongs_to :place_type
  belongs_to :place_region
  validates :title, :description, :rooms, :bathrooms, :rent, presence: true
end
