Meetapp::Application.routes.draw do
  resource :session, :only => [:new, :create, :destroy]
  resources :users
  resources :groups
  root to: "users#index"
end
