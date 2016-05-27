Rails.application.routes.draw do
  root 'pages#home'

  get 'signup' => 'users#new'
  get 'signin' => 'pages#signin'
  get 'about' => 'pages#about'
  get 'home' => 'pages#home'
  
  resources :users
end
