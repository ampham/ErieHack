Rails.application.routes.draw do
	resources :users
  # The only RESTful action we want for account_activation is edit, where the 
  # user will click an activation link to change their 'activated' attribute 
  # from false to true
  resources :account_activations, only: [:edit]
  resources :locations
  resources :updates

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end