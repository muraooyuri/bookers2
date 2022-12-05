Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about'=>'homes#about', as: 'about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users


  resources :books, only: [:create, :index, :show, :destroy, :edit] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end
