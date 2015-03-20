Rails.application.routes.draw do


  resources :answers, except: [:new, :create, :show, :index]

  resources :questions do
    resources :answers, only: [:new, :create]
  end


  root 'sessions#new'
  resources :sessions
  resources :users

  resources :categories, only: [:index, :show]


end
