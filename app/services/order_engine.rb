class OrderEngine

  def self.order(order_id, user_id, menu_id, qty)
    
    order = find_or_create_order(order_id, user_id)
    
    order_item = update_or_create_order_item(order, qty, menu_id)
    
    return order.id, order_item.menu.name
  end  
  
  def self.find_or_create_order(order_id, user_id)
    user = User.find user_id  
    if order_id.present?
        order = user.orders.find order_id
    else
        order = Order.new(user_id: user_id)
        order.ordering_date = Date.today
        order.save
    end
    order
  end
  
  def self.update_or_create_order_item(order, quantity, menu_id)
    order_item = order.order_items.find_by(menu_id: menu_id)
    if order_item.present?
        order_item.quantity += quantity.to_i
    else
        order_item = order.order_items.new
        order_item.menu_id = menu_id
        order_item.quantity = quantity
    end
    order_item.save  
    order_item
  end
  
end
