Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :items
  resources :purchases, only: [:index, :show, :create] do
    collection do
      post 'confirm'
    end
  end
  
  resources :sales, only: [:index, :show]
  
  resources :companies do
    collection do
      post 'confirm'
    end
    member do
      put 'edit'
      patch 'confirm'
    end
  end
  
end
