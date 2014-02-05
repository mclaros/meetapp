Meetapp::Application.routes.draw do
  resource :session, :only => [:new, :create, :destroy]
  resources :users
  root to: "users#index"
end
