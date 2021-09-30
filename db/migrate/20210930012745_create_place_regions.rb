class CreatePlaceRegions < ActiveRecord::Migration[6.1]
  def change
    create_table :place_regions do |t|
      t.string :name

      t.timestamps
    end
  end
end