Rails.application.routes.draw do
  resources :categories
  devise_for :users

  resources :discussions do
    resources :posts, only: [:create, :show, :edit, :update, :destroy], module: :discussions
  end

  root to: 'static#home'
end
