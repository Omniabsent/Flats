class AddTypeIdToPlaces < ActiveRecord::Migration[6.1]
  def change
    add_reference :places, :type, null: false, foreign_key: true
  end
end
