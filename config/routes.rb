Rails.application.routes.draw do

  get 'users/new' => 'users#new'
  get 'users/login' => 'users#login_form'
  get '/' => 'home#index'
  get '/users/edit/:id' => 'users#edit'

  post 'users/create' => 'users#create'
  post 'users/login' => 'users#login'
  post 'users/logout' => 'users#logout'
  post 'users/update/:id' => 'users#update'
  post 'users/delete/:id' => 'users#delete'

  get 'users/:id' => 'users#show'

end
