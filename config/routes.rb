Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "login", to: "authentication#login"
  get "/authenticate", to: "authentication#token_check"
  get "/clothing_items/user/:username", to: "clothing_items#index_by_user"

  resources :clothing_items, except: [:new, :edit]
  resources :clothing_categories, only: [:index, :show]
  resources :users, only: [:create]

end 