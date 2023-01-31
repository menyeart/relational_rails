class CreateNationalParks < ActiveRecord::Migration[5.2]
  def change
    create_table :national_parks do |t|
      t.string :name
      t.string :state
      t.integer :total_acres
      t.boolean :charges_fee
      t.timestamps
    end
  end
end
