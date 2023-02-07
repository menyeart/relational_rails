Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/national_parks', to: 'national_parks#index'
  get '/trails', to: 'trails#index'
  get 'trails/:id', to: 'trails#show'
  get '/national_parks/:national_park_id/trails', to: 'national_park_trails#index'
  get '/national_parks/new', to: 'national_parks#new'
  post '/national_parks', to: 'national_parks#create'
  get '/national_parks/:id', to: 'national_parks#show'
  get '/national_parks/:id/edit', to:  'national_parks#edit'
  patch '/national_parks/:id/', to:  'national_parks#update'
  get '/national_parks/:id/trails/new', to: 'national_park_trails#new'
  post '/national_parks/:id/trails', to: 'national_park_trails#create'
  get '/trails/:id/edit', to:  'trails#edit'
  patch '/trails/:id/', to:  'trails#update'
end
