Rails.application.routes.draw do
  resources :audio_recording_fragments
  resources :audio_recordings
  resources :tags
  resources :agents
  resources :artefacts
  resources :milliseconds
  resources :seconds
  resources :minutes
  resources :hours
  resources :days
  resources :months
  resources :quarters
  resources :years
  resources :decades
  resources :absolute_date_nodes
  resources :geospatial_nodes
  resources :absolute_date_time_roots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
