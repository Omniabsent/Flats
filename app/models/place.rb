class Place < ApplicationRecord
  belongs_to :place_type
  belongs_to :place_region
  belongs_to :place_owner
  validates :title, :description, :rooms, :bathrooms, :rent, presence: true
end
