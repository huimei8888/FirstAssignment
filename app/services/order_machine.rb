class OrderMachine
  attr_reader :menu
  attr_accessor :order
    
  def initialize(order_id, user_id, menu_id, qty)
    @order_id = order_id
    @user_id = user_id
    @quantity = qty
    @menu = Menu.find menu_id
  end
  
  def ordering
    
    find_or_create_order
    
    update_or_create_order_item
    
  end  
  
  private
  
  def find_or_create_order
    user = User.find @user_id  
    if @order_id.present?
        self.order = user.orders.find @order_id
    else
        order = Order.new(user_id: @user_id)
        order.ordering_date = Date.today
        order.save
        self.order = order
    end
  end
  
  def update_or_create_order_item
    order_item = order.order_items.find_by(menu_id: menu.id)
    if order_item.present?
        order_item.quantity += @quantity.to_i
    else
        order_item = order.order_items.new
        order_item.menu_id = menu.id
        order_item.quantity = @quantity
    end
    order_item.save  
  end
end