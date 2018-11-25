class UserLoginController < ApplicationController
   layout "login"
  def new
  end 
  
  def create
    user = User.find_by(email: params[:email], password: params[:password])
    
    if user.present?
      flash[:notice] = "You are signed in successfully"
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to orderings_path
    else
      flash[:alert] = "Email and password is incorrect"
      redirect_to action: :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    flash[:notice] = "You are signed out successfully"
    redirect_to orderings_path
  end
  
  def admin_login
    
  end
  
  def create_admin_session
    admin = Admin.find_by(email: params[:email], password: params[:password])
    
    if admin.present?
      flash[:notice] = "You are signed in as admin successfully"
      session[:admin_id] = admin.id
      redirect_to admins_path
    else
      flash[:alert] = "Email and passwords is incorrect"
      redirect_to action: :admin_login
    end
  end

  def destroy_admin_session
    session[:admin_id] = nil
    flash[:notice] = "You are signed out successfully"
    redirect_to action: :admin_login
  end
end
