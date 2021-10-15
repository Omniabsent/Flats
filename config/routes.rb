Rails.application.routes.draw do
  devise_for :visitors
  devise_for :place_owners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  #get "details/details" => "details#details"
  resources :places, only: [:show, :new, :create, :destroy] do
    get 'my_places', on: :collection
  end
  resources :place_types, only: [:show, :new, :create]
  resources :place_regions, only: [:show, :new, :create]
  resources :place_reservations, only: %i[create]
end
