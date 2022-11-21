Rails.application.routes.draw do
  get 'items/index'
  root to: 'items#index'
  resources :orders, only:[:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
