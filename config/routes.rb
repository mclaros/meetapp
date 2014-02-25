Meetapp::Application.routes.draw do
  resource :session, :only => [:new, :create, :destroy]
  resources :meetings do
  	resources :comments, :only => [:index, :create, :update]
  end
  resources :users do
  	resources :meetings, :only => [:index]
  	resources :comments, :only => [:index]
  end
  resources :groups do
  	resources :meetings, :only => [:index]
  	resources :comments, :only => [:index, :create, :update]
  end
  root to: "users#index"
end
