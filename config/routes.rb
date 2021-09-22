Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  #get "details/details" => "details#details"
  resources :details, only: [:show]
end
