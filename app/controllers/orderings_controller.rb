class OrderingsController < ApplicationController
  before_action :authenticate_user, except: [ :index ]
  
  def index
    @order = Order.find_by(user_id: session[:user_id], is_checked_out: false)
    if @order.present?
      session[:order_id] = @order.id
    else
      session[:order_id] = nil
    end
    
    @categories = Category.order(:position)
    # if params[:category_id].present?
    #   @menus = Menu.where(category_id: params[:category_id]).order(:position)
    # else
    #   @menus = Menu.joins(:category).order("categories.position, menus.position")
    # end
  end
  
  def order
    if session[:user_id].present?
      # order_id, menu_name = OrderEngine.order(session[:order_id], session[:user_id], params[:menu_id], params[:quantity] )
      
      order_machine = OrderMachine.new(session[:order_id], session[:user_id], params[:menu_id], params[:quantity] )
      
      order_machine.ordering
      
      session[:order_id] = order_machine.order.id
  
      flash[:notice] = "You have just order #{order_machine.menu.name}"
      redirect_to action: :index
    else
      flash[:alert] = "Please sign in first before continue"
      redirect_to "/login"
    end
  end
  
  
  
  def checkout
    @order = Order.find(session[:order_id])
    if !@order.order_items.any?
      flash[:alert] = "You cannot checkout without order any food"
      redirect_to orderings_path
    end
  end
  
end
