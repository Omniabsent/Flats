class AddPlaceTypeToPlace < ActiveRecord::Migration[6.1]
  def change
    add_reference :places, :place_type, null: false, foreign_key: true
  end
end
