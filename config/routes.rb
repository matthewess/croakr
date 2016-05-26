Rails.application.routes.draw do
  get 'splash' => 'pages#splash'
  get 'signin' => 'pages#signin'
  get 'about' => 'pages#about'
  get 'home' => 'pages#home'
  root 'pages#home'
end
