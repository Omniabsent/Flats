class Place < ApplicationRecord
  belongs_to :place_type
  attr_accessor :title, :description, :rooms
end
