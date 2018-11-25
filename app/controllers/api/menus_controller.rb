class Api::MenusController < ApplicationController
  skip_before_action :verify_authenticity_token
  #before_action :authenticate_token
  
  def index
    if params[:category_id].present?
      menus = Menu.where(category_id: params[:category_id]).order(:position)
    else
      menus = Menu.joins(:category).order("categories.position, menus.position")
    end
    render json: Menu.all
  end
  
  def create
    order_machine = OrderMachine.new(session[:order_id], session[:user_id], params[:menu_id],  params[:quantity] )
                                     
    if order_machine.valid?
      order_machine.ordering
      session[:order_id] = order_machine.order.id
      a = "you have just order #{order_machine.menu.name}"
    else
      a = "You need a valid quantity"
    end
    render json: { notice: a }
  end

  
  
end

