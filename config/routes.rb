Rails.application.routes.draw do
  
  
  devise_for :users, path: '', path_names: {
    sign_in: 'login', sign_out: 'logout',
    password: 'secret', confirmation: 'verification',
    registration: 'register', edit: 'edit/profile'
  }, sign_out_via: [:get, :post]

  resources :recipes, only: [:index, :show, :new, :edit, :create, :patch, :destroy] do
    patch 'toggle_public', on: :member
  end
  resources :users
  resources :recipe_foods
  resources :foods, only: [:index, :show, :new, :edit,:create, :destroy]
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
  
  get 'public_recipes', to: 'public_recipes#index', as: 'public_recipes'
  get 'public_recipes/:id', to: 'public_recipes#show', as: 'public_recipe'
  get 'general_shopping_lists', to: 'general_shopping_lists#index', as: 'general_shopping_lists'
  root 'public_recipes#index'
end
