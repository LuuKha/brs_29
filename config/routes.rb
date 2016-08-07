Rails.application.routes.draw do
  post "/rate" => "rater#create", as: "rate"
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root "static_pages#home"
  resources :books, only: [:index, :show] do
    resources :reviews
  end
  namespace :admin do
    resources :books
    resources :users, only: [:show, :index, :destroy]
    resources :categories, except: :show
  end
  resources :users, only: :show
end
