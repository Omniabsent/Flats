class CreatePlaceReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :place_reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :guests
      t.decimal :total_value
      t.references :place, null: false, foreign_key: true
      t.references :visitor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
