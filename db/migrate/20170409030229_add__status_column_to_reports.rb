class AddStatusColumnToReports < ActiveRecord::Migration[5.0]
  def change
  	add_column :reports, :status, :integer
  	add_column :reports, :notes, :text
  	add_column :reports, :address, :string
  end
end
