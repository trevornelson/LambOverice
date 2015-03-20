Rails.application.routes.draw do


  root 'questions#index'
  resources :sessions
  resources :users


  resources :answers, except: [:new, :create, :show, :index]

  resources :questions do
    resources :answers, only: [:new, :create]
  end


  root 'sessions#new'
  resources :sessions
  resources :users

  resources :categories, only: [:index, :show]


end
