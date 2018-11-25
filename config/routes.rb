Rails.application.routes.draw do
  resources :payments, only: [:new, :create]
  get 'payment/new'
  get 'sign_up', to: "sign_up#new"
  post 'sign_up', to: "sign_up#create"
  post 'login', to: "user_login#create"
  get 'login', to: "user_login#new"
  post 'admin/login', to: "user_login#create_admin_session"
  get 'admin/login', to: "user_login#admin_login"
  delete "logout", to: "user_login#destroy"
  delete "admin/logout", to: "user_login#destroy_admin_session"
  
  resources :orderings, only: [ :index ] do
    collection do
      post "order" 
      get "checkout"
      post "update_order_items"
      
    end
    
    member do
      delete "decrement_quantity"
      put "increment_quantity"
    end
  end
  resources :orders do
    resources :order_items, only: [ :update, :destroy ] do
      collection do
        patch "update_all"
      end
    end
    collection do
      post :create_order_items
    end
  end
  resources :admins
  resources :users
  resources :menus
  resources :categories
  
  namespace :api do
    resources :menus
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

   