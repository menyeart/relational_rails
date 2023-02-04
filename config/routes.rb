Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/national_parks', to: 'national_parks#index'
  # get '/national_parks/:id', to: 'national_parks#show'
  get '/trails', to: 'trails#index'
  get 'trails/:id', to: 'trails#show'
  get '/national_parks/:national_park_id/trails', to: 'national_park_trails#index'
  get '/national_parks/new', to: 'national_parks#new'
  post '/national_parks', to: 'national_parks#create'
  
  # changed commented out route above to route below as route to national park new in link was routing to the show controller with 'new' as the id
  get '/national_parks/:id' => 'national_parks#show'
  # , as: 'national_park' constraints: { id: /\d.+/ }

  get '/national_parks/:id/edit', to:  'national_parks#edit'
  patch '/national_parks/:id/', to:  'national_parks#update'
  
  

end
