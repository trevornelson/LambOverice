Rails.application.routes.draw do


  root 'questions#index'
  resources :sessions
  resources :users


  resources :answers, only: [:edit, :destroy] do
    resources :comments, only: [:create]
  end

  resources :questions do
    resources :answers, only: [:new, :create]
    resources :comments, only: [:create]
  end

  resources :categories, only: [:index, :show]

  resources :votes, only: [:create]

  get '/recent/questions', to: 'questions#recent'
  get '/trending/questions', to: 'questions#trending'

end
