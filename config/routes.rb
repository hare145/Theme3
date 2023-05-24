Rails.application.routes.draw do
  devise_for :users
  root  to: "homes#top", as: "top"
  get "homes/about" => "homes#about", as: "about"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :show, :update, :index,]
  resources :books, only: [:new, :create, :edit, :show, :index, :destroy]
end
