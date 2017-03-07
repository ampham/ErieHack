class AddUserIdToUpdates < ActiveRecord::Migration[5.0]
  def change
    add_column :updates, :user_id, :integer
  end
end
