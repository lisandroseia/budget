# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'categories#index'
  resources :categories, only: %i[index show new create] do
    resources :payments, only: %i[index new create]
  end
end
