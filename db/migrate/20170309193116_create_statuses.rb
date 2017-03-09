class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.integer :o2
      t.integer :conductivity
      t.integer :pH
      t.integer :turbidity
      t.integer :temp

      t.timestamps
    end
  end
end
