class AddColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :delivery_address, :string
    add_column :orders, :contact_number, :string
  end
end
