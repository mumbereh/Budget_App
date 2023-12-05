# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#welcome'

  devise_for :users
  resources :categories, only: %i[index show new create destroy] do
    resources :transactions, only: %i[index show new create destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
