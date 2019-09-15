Rails.application.routes.draw do

  get 'users/new' => 'users#new'
  get 'users/login' => 'users#login_form'
  get '/' => 'home#index'

  post 'users/create' => 'users#create'
  post 'users/login' => 'users#login'
  post 'users/logout' => 'users#logout'

end
