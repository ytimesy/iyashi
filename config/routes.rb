Rails.application.routes.draw do
  devise_for :users

  root to: 'conversations#index'
  resources :conversations do
    resources :messages
  end
end
