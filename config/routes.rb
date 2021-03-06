Rails.application.routes.draw do
  get  '/auth/:provider/callback', to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'
  root 'static_pages#home'
  # get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  resources :users,         onle: [:show]
  resources :microposts,    only: [:create, :destroy, :new, :index]
  resources :likes,         only: [:create, :destroy]
end
