Rails.application.routes.draw do
  devise_for :users

  root to: "children#index"
  get "/home", to: redirect("/")

  resources :mass_emails, only: [:create, :index, :show, :update, :destroy]
  resources :attendance_records, only: [:create, :index, :show, :update, :destroy]
  resources :notes, only: [:create, :index, :show, :update, :destroy]
  resources :images, only: [:create, :index, :show, :update, :destroy]
  resources :children, only: [:create, :index, :show, :update, :destroy]
  resources :users, only: [:create, :index, :show, :update, :destroy]
end
