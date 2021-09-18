class AddDetailFieldsToPlace < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :bathrooms, :integer
    add_column :places, :pets, :boolean
    add_column :places, :parking_slot, :boolean
    add_column :places, :rent, :integer
  end
end
