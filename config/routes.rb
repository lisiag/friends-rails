Rails.application.routes.draw do
  # devise_for :users, :path_prefix => 'my'

  # resources :users do
  #   member do
  #     put :update
  #   end
  # end

  resources :friends
  # get 'home/index'
  get 'home/about'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
