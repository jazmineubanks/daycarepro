Rails.application.routes.draw do
  devise_for :users

  root to: "children#index"
  get "/home", to: redirect("/")

  resources :mass_emails, only: [:create, :index, :show, :update, :destroy]
  resources :attendance_records, only: [:create, :index, :show, :update, :destroy]
  resources :notes, only: [:create, :index, :show, :update, :destroy]
  resources :images, only: [:create, :index, :show, :update, :destroy]
  resources :users, only: [:create, :index, :show, :update, :destroy]
  resources :children

  # Add the following line to define the route for creating a child
  post "/insert_child", to: "children#create"
  delete "/children/:id", to: "children#destroy", as: "delete_child"
  patch "/modify_child/:id", to: "children#update", as: "modify_child"
end

