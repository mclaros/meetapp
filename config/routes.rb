Meetapp::Application.routes.draw do
  resource :session, :only => [:new, :create, :destroy]
  resources :meetings do
  	resources :comments, :only => [:index, :show, :create, :update]
  end
  resources :users do
  	resources :meetings, :only => [:index]
  	resources :comments, :only => [:index]
  end
  resources :groups do
  	resources :meetings, :only => [:index]
  	resources :comments, :only => [:index, :create, :update]
  end

  resource :mockup, :only => [] do 
    get "root/index", to: "mockups#root_index"
    get "user/show", to: "mockups#user_show"
  end

  root to: "users#index"
end
