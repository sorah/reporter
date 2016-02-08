Rails.application.routes.draw do
  resources :incident_types
  resources :incidents
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  get '/site/sha' => RevisionPlate::App.new
end
