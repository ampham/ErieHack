class AddPhoneToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :phone, :string
  end
end
