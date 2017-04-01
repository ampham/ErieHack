class AddStatusToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :status, :int
    add_column :alerts, :notes, :text
    add_column :alerts, :address, :string
  end
end
