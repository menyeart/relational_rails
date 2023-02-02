class AddNationalParksToTrails < ActiveRecord::Migration[5.2]
  def change
    add_reference :trails, :national_park, foreign_key: true
  end
end
