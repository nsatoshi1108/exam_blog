Rails.application.routes.draw do
  get 'sessions/new'

  resources :blogs do
    collection do
      post :confirm
      get :top
    end
  end

  resources :users

  resources :sessions,only: [:new, :create, :destroy]
end
