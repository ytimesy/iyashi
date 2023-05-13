Rails.application.routes.draw do
  devise_for :users
  resources :conversations do
    resources :messages
  end
end
