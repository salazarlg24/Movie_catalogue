Rails.application.routes.draw do
  root 'movies#index'

  get '/movies' => 'movies#index'

  post '/movies' => 'movies#create'

  get '/movies/:id/edit' => 'movies#edit'

  patch '/movies/:id' => 'movies#update'

  delete '/movies/:id' => 'movies#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
