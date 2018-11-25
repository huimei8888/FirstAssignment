class OrderItemsController < ApplicationController
  before_action :authenticate_user
  
  def destroy
    order = Order.find params[:order_id]
    order_item = order.order_item.find params[:id]
    
    order_item_machine = OrderItemMachine.new(order_item: order_item, situation_id: 2)
    order_item_machine.manage_quantity
    flash[:notice] = order_item_machine.message
    
    redirect_to orderings_path
  end
  
  def update
    order_item = OrderItem.find params[:id]
    order_item_machine = OrderItemMachine.new(order_item: order_item, situation_id: 1)
    order_item_machine.manage_quantity
    flash[:notice] = order_item_machine.message
    redirect_to orderings_path
  end

  def update_all
    params[:order_item].each do |order_item_id, quantity_params|
      order_item = OrderItem.find order_item_id
      order_item_machine = OrderItemMachine.new(order_item: order_item, situation_id: 3, input_quantity: quantity_params[:quantity])
      order_item_machine.manage_quantity
    end
    
    flash[:notice] = "You have updated your order"
    redirect_to checkout_orderings_path
  end
end
