Rails.application.routes.draw do
  
  
  resources :students
  resources :reviews
  resources :subjects

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

  resources :users do
    resources :payments
    resources :messages
    resources :reviews
    # resources :tutors

    #user profile
    # resources :tutors, only: [:create, :update]
    # get 'profile', to: 'tutors#index'
    # get 'profile/new', to: 'tutors#new'
    # get 'profile/:id', to: 'tutors#show', :as => :profile_show
    # get 'profile/:id/edit', to: 'tutors#edit', :as => :profile_edit

    # delete 'profile/:id', to: 'tutors#destroy', :as => :profile_delete

    resources :tutors, only: [:create, :update] 
    resources :students, only: [:create, :update]
    get 'profile', to: 'profiles#index'
    get 'profile/new', to: 'profiles#new'
    get 'profile/:id', to: 'profiles#show'
    get 'profile/:id/edit', to: 'profiles#edit', :as => :profile_edit


    delete 'profile/:id', to: 'profiles#destroy', :as => :profile_delete 
  end


  root 'pages#home'

  get '/register', to: 'users#new'
end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
