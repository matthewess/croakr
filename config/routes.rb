Rails.application.routes.draw do
  root 'pages#home'

  get 'about' => 'pages#about'
  get 'home' => 'pages#home'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'signup' => 'users#new'
  resources :users
end
