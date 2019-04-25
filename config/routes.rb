Rails.application.routes.draw do
  root to: 'toppages#index'
  resources :companies
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :items
  resources :purchases, only: [:index, :show, :create]
  
end
