Rails.application.routes.draw do
  devise_for :users
  resources :users
  root 'pages#home'

  get '/register', to: 'users#new' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
