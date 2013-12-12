RideShare::Application.routes.draw do

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  resources :users do
  	member do
  		post :rate
  	end
  end
  resources :sessions
  resources :trips do
    member do
      put :apply_for
      put :unapply_for
      put :accept_for
    end
  end

  root :to => "sessions#new"
end