class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.integer :park_id
      t.string :name
      t.integer :length_miles
      t.boolean :water_source
      t.integer :feet_elevation_gain
      t.timestamps
    end
  end
end
