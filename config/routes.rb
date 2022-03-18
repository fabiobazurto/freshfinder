Rails.application.routes.draw do
  resources :zones, only: [:index, :create]
  root to: "zones#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
