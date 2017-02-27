Rails.application.routes.draw do

root to: 'recipes#index'
resources :users, only:[:new, :create, :show]
resources :recipes, only:[:new, :create, :show]

end
