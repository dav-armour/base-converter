Rails.application.routes.draw do
  root 'home#index'
  get 'home', to: 'home#index'
  post 'home', to: 'home#calculate', as: 'calculate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
