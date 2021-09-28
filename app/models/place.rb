class Place < ApplicationRecord
  has_many :place_type
  attr_accessor :title, :description, :rooms
end
