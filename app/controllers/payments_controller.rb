class PaymentsController < ApplicationController
  
  def new
    @order = Order.find session[:order_id]
  end
  
  def create
    
    flash[:notice] = "Order confirm. Payment successfully"
    @order = Order.find_by(user_id: session[:user_id], id: session[:order_id])
    @order.is_checked_out = true
    @order.save
    UserMailer.confirm_order(session[:user_id], session[:order_id]).deliver_now
    session[:order_id] = nil
    redirect_to orderings_path
  end
  
end
