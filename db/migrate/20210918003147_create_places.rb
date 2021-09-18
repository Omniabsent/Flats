class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :title
      t.string :description
      t.integer :rooms

      t.timestamps
    end
  end
end
