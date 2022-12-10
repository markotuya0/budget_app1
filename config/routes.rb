Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    authenticated do
      root to: 'groups#index'
    end

    unauthenticated do
      root to: 'welcomes#index', as: 'unauthenticated_user_root'
    end
    
  end
  

  resources :users
  resources :groups, only: [:index, :new, :create] do
    resources :entities, only: [:index, :new, :create]
  end
end
