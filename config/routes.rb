Rails.application.routes.draw do
  resources :menus do
    resources :food_dishes
  end
end
