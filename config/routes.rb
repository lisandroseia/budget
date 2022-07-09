# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :pages, only: %i[index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  unauthenticated :user do
    root 'pages#index', as: :unauthenticated_root
  end

  resources :categories, only: %i[index show new create] do
    resources :payments, only: %i[index new create]
  end
end
