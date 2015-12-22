Rails.application.routes.draw do
  
  resources :advertisements
  root to: "advertisements#index"
  
  get '/id:id' => 'users#show', as: 'user'
  get '/users/coords' => 'coords'
  
  get '/responses' => 'responses#index', as: 'responses'
  get '/responses/new/:id' => 'responses#new', as: 'new_response'
  post '/responses/:id' => 'responses#create', as: 'response'
  delete '/responses/:id' => 'responses#destroy'
  
  devise_for :users, controllers: {
    confirmations: "users/confirmations",
    omniauth_callbacks: "users/omniauth_callbacks",
    passwords:     "users/passwords",
    registrations: "users/registrations",
    sessions:      "users/sessions"
  }
  
end
