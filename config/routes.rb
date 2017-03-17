Rails.application.routes.draw do

devise_for :users

root to: 'recipes#index'

resources :recipes, only:[:new, :create, :show, :edit, :update, :destroy]
resources :cookeries, only:[:new, :create, :show]
resources :foods, only:[:new, :create, :show]
resources :users, only: [:show]

end
