Meetapp::Application.routes.draw do
  resource :session, :only => [:new, :create, :destroy]
  resources :meetings
  resources :users do
  	resources :meetings, :only => [:index]
  end
  resources :groups do
  	resources :meetings, :only => [:index]
  end
  root to: "users#index"
end
