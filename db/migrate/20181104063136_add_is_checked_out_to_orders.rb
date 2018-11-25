class AddIsCheckedOutToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :is_checked_out, :boolean, default: false
  end
end
