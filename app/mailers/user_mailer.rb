class UserMailer < ApplicationMailer
    
  def welcome_email(user_id)
    @user = User.find user_id
    attachments["sample.jpg"] = File.read("#{Rails.root}/app/assets/images/pgfood.jpg")
    mail(to: @user.email, subject: 'Welcome to Food Delivery')
  end
  
  def confirm_order(user_id, order_id)
    @order = Order.find order_id
    @user = User.find user_id
    mail(to: @user.email, subject: 'Order Confirmation')
  end

end
