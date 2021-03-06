Rails.application.routes.draw do
  devise_for :users
  devise_for :visitors
  devise_for :place_owners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  #get "details/details" => "details#details"
  resources :places, only: [:show, :new, :create, :destroy] do
    get 'my_places', on: :collection
    resources :place_reservations, only: %i[create show new index] do
      post 'accept', on: :member
    end
  end
#  resources :place_reservations, only: %i[show]
  resources :place_types, only: [:show, :new, :create]
  resources :place_regions, only: [:show, :new, :create]
end
