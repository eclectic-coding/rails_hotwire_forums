Rails.application.routes.draw do
  devise_for :users

  resources :discussions

  root to: 'static#home'
end
