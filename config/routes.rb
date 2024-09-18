Rails.application.routes.draw do
  namespace :admin do
    resources :orders
    resources :products do
      resources :stocks
    end
    
    resources :categories
  end
  devise_for :admins
  root "home#index"

  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end 

  get "admin" => "admin#index"
end