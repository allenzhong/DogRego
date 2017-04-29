Rails.application.routes.draw do
	root to: 'dashboard#index'
	
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resource :user do
    resources :profile
  end
  
  resources :dogs do
  	member do
  		get 'register'
	  end
  end
  
  get 'dashboard/index'
end
