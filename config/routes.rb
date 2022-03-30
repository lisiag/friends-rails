Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my', :controllers => { registrations: 'users/registrations' }
  devise_scope :user do
    get "users" => "users/registrations#listUsers"
    get "/users/:id/edit", to: "users/registrations#edit_other", as: 'edit_user'
    put "/users/:id", to: "users/registrations#update_other", as: 'user'
  end

  resources :friends
  # get 'home/index'
  get 'home/about'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
