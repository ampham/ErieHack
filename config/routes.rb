Rails.application.routes.draw do
	resources :users
  # The only RESTful action we want for account_activation is edit, where the 
  # user will click an activation link to change their 'activated' attribute 
  # from false to true
  resources :account_activations, only: [:edit]
  resources :locations
  resources :updates
  resources :statuses
  resources :buffalo_reports, only: [:index]

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # API routes
  scope '/api' do
    scope '/v1' do
      scope '/locations' do
        get '/' => 'api_locations#index'
        get '/:id' => 'api_locations#show'
      end
    end
  end

  # temporary endpoint for demonstration only
  get '/current' => 'api_locations#current'

  scope '/buffalo_reports' do
    get '/test', to: 'buffalo_reports#test'
  end

  post '/zip', to: 'text_messages#reply_zip'
  get '/test', to: 'text_messages#test_json'

  # Twilio test
  post '/sms', to: 'text_messages#send_text'
end