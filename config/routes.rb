Rails.application.routes.draw do
  # Home controller routes.
  root 'home#index'
  get 'auth' => 'home#auth'
  
  post 'user_token' => 'user_token#create'

  # User actions
  get    '/users'          => 'users#index'
  get    '/users/current'  => 'users#current'
  post   '/users/create'   => 'users#create'
  patch  '/user/:id'       => 'users#update'
  delete '/user/:id'       => 'users#destroy'


  scope '/' do
    # Menu and FoodDish actions
    resources :menus do
      resources :food_dishes
    end
    post 'user_token' => 'user_token#create'
  end
end
