class RemoveParkIdFromTrails < ActiveRecord::Migration[5.2]
  def change
    remove_column :trails, :park_id, :integer
  end
end
