class CreateUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :updates do |t|
      t.float :lead
      t.float :mercury
      t.float :plutonium

      t.timestamps
    end
  end
end
