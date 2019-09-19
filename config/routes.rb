Rails.application.routes.draw do

  get 'users/new' => 'users#new'
  get 'users/login' => 'users#login_form'
  get '/' => 'home#index', as: "home/index"
  get 'users/edit/:id' => 'users#edit'
  get 'users/:id' => 'users#show'

  post 'users/create' => 'users#create'
  post 'users/login' => 'users#login'
  post 'users/logout' => 'users#logout'
  post 'users/update/:id' => 'users#update'
  post 'users/delete/:id' => 'users#delete'

  get 'posts/new' => 'posts#new'
  get 'posts/:id' => 'posts#show'

  post 'posts/create' => 'posts#create'
  post 'posts/delete/:id' => 'posts#delete'

  post "likes/create/:id" => "likes#create"
  post "likes/delete/:id" => "likes#delete"

end
