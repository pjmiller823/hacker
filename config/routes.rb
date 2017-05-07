Rails.application.routes.draw do
  resources :stories do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'stories#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  mount Shrine::DownloadEndpoint => "/attachments"
end
