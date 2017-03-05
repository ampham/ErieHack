class AddLocationIdToUpdates < ActiveRecord::Migration[5.0]
  def change
    add_column :updates, :location_id, :integer
  end
end
