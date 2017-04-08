class AddIds < ActiveRecord::Migration[5.0]
  def change
  	add_column :months_waters, :account_id, :integer
  	add_column :reports, :account_id, :integer
  end
end
