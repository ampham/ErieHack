class CreateBuffaloReports < ActiveRecord::Migration[5.0]
  def change
    create_table :buffalo_reports do |t|
      t.string :street
      t.string :zip
      t.decimal :lead

      t.timestamps
    end
  end
end
