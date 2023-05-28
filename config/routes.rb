Rails.application.routes.draw do
  devise_for :users
  root  to: "home#top", as: "top"
  get "home/about" => "home#about", as: "about"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :show, :update, :index,]
  resources :books, only: [:create, :edit, :update, :show, :index, :destroy]
end
