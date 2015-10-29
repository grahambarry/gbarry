Rails.application.routes.draw do
  resources :picture_frames
  get 'picture_frames/portrait'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'uses/new'

 resources :pins



  resources :pins do
  	resources :pins
  	member do
  		put "like",    to: "pins#upvote"
  	end
  end

  root "pins#index"
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'signup'  => 'uses#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :uses

  resources :pins
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]


end


