Rails.application.routes.draw do
  namespace :api do
    get "/orders" => 'orders#index'
    post "/orders" => 'orders#create'
    
    post "/users" => 'users#create'

    post "/sessions" => "sessions#create"

    get "/carted_products" => "carted_products#index"
    post "/carted_products" => "carted_products#create"

    get "/products" => 'products#index'
    post "/products" => 'products#create'
    get "/products/:id" => 'products#show'
    patch "/products/:id" => 'products#update'
    delete "/products/:id" => 'products#destroy'

    delete "/carted_products/:id" => 'carted_products#destroy'
    
  end
  
end
