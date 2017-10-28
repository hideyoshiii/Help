Rails.application.routes.draw do

  resources :listings

  root :to => "pages#search"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",:registrations => 'registrations' }

  resources :users, only: [:show]
  

  resources :listings do 
    resources :proposals, only: [:show, :new, :create]
  end

  resources :proposals do 
    resources :approvals, only: [:create]
  end

  resources :approvals do
    resources :reviews, only: [:create, :new]
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end



  get '/index' => 'pages#index'

  post "likes/:listing_id/create" => "likes#create"
  post "likes/:listing_id/destroy" => "likes#destroy"

  get '/proposals' => 'proposals#index'
  get '/proposaled' => 'proposals#proposaled'

  get '/approvals' => 'approvals#index'
  get '/approved' => 'approvals#approved'

  get "users/:id/likes" => "users#likes"

  get "/notification" => "pages#notification"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
