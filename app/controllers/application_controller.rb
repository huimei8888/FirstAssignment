class ApplicationController < ActionController::Base
    def authenticate_user
        if session[:user_id].present?
            
        else
          flash[:alert] = "Please sign in first before continue"
          redirect_to "/login"
        end
    end
    
    def authenticate_admin
        if session[:admin_id].present?
            
        else
          flash[:alert] = "Please sign in first before continue"
          redirect_to admin_login_path
        end
    end
end
