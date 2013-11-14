RideShare::Application.routes.draw do

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  get "trips/apply"

  resources :users do
  	member do
  		post :rate
  	end
  end
  resources :sessions
  resources :trips

  root :to => "sessions#new"
end