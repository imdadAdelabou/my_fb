Rails.application.routes.draw do
  get 'sessions/new'
  get 'posts/index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :posts do 
    collection do 
      post :confirm
    end
  end
  root 'sessions#new'
  # root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
