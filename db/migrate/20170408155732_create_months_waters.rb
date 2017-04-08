class CreateMonthsWaters < ActiveRecord::Migration[5.0]
  def change
    create_table :months_waters do |t|
      t.integer :gallons

      t.timestamps
    end
  end
end
