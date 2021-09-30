class AddPlaceRegionToPlaces < ActiveRecord::Migration[6.1]
  def change
    add_reference :places, :place_region, null: false, foreign_key: true
  end
end
