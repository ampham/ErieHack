class AddUserIdToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :user_id, :integer
    add_column :statuses, :location_id, :integer
  end
end
