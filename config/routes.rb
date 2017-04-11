Rails.application.routes.draw do

devise_for :users

root to: 'recipes#index'

resources :recipes, only:[:new, :create, :show, :edit, :update, :destroy] do
  collection do
    get 'favorite'
  end
end

resources :cookeries, only:[:new, :create, :show]
resources :foods, only:[:new, :create, :show]

resources :users, only: [:show] do
 collection do
   get 'favorite'
   get 'unfavorite'
 end
end

end
