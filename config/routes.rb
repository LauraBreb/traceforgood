Rails.application.routes.draw do
  resources :companies do
    resources :users, only: [:edit, :update]
  end
  
  get 'static_pages/index'
  get 'static_pages/phase0'
  get 'static_pages/phase1'
  get 'static_pages/phase2'
  get 'static_pages/phase3'
  get 'static_pages/phase4'
  root 'static_pages#index'
  
  devise_for :users

end
