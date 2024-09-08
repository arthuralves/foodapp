Rails.application.routes.draw do
  devise_for :admins
  
  authenticated :admin do
    root to: "admin#index", as: :admin_root
  end 

  get "admin" => "admin#index"
  root "home#index"


end