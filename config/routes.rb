Rails.application.routes.draw do
  
  resources :subjects
  resources :users do
    resources :payments
    resources :messages
  end
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations'
  }
  devise_scope :user do
    get 'signup', to: 'users/registrations#new'
    get 'signin', to: 'users/sessions#new'
    delete 'signout', to: 'users/sessions#destroy'
  end


  root 'pages#home'

  get '/register', to: 'users#new'
end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
