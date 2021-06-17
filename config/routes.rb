Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :companies

    root to: "users#index"
  end
  
  devise_for :users

  resources :users, only: [:show]
  
  as :user do
    get 'users', :to => 'users#show', :as => :user_root
  end

  resources :companies do
    resources :users, only: [:edit, :update]
  end

  get 'static_pages/landing_page'
  get 'static_pages/about'
  get 'static_pages/team'
  get 'static_pages/contact'
  get 'static_pages/index'
  get 'static_pages/phase0'
  get 'static_pages/phase1'
  get 'static_pages/phase2'
  get 'static_pages/phase3'
  get 'static_pages/phase4'
  root 'static_pages#landing_page'

end
