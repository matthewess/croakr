Rails.application.routes.draw do
  root 'pages#home'

  get 'about' => 'pages#about'
  get 'home' => 'pages#home'

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
  
  get 'signup' => 'users#new'
  resources :users
end
