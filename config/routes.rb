Rails.application.routes.draw do
  get 'signup' => 'users#new'
  get 'signin' => 'pages#signin'
  get 'about' => 'pages#about'
  get 'home' => 'pages#home'
  root 'pages#home'
end
