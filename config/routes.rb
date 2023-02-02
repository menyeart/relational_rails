Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/national_parks', to: 'national_parks#index'
  get '/national_parks/:id', to: 'national_parks#show'
  get '/trails', to: 'trails#index'
  get 'trails/:id', to: 'trails#show'
  get '/national_parks/:national_park_id/trails', to: 'national_park_trails#index'

end
