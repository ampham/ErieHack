class AddStreamClassToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :stream_class, :string
    add_column :locations, :quality_issues, :text
  end
end
