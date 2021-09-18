Rails.application.routes.draw do
  devise_for :users

  resources :discussions, only: [:index, :create, :new, :edit, :update]

  root to: 'static#home'
end
