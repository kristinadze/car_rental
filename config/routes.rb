Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cars do 
    collection do 
      get :browse
    end
  end
  resources :car_rental_requests, only: [:new, :create] do
    member do
      post :approve
      post :deny
    end
  end
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  root to: redirect('/cars')
end
