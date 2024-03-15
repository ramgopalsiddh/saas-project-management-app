Rails.application.routes.draw do
  resources :projects do
    resources :members do
      collection do
        post :invite
      end
    end
    resources :artifacts
  end
  resources :accounts
  devise_for :users, controllers: { registrations: 'registrations' }

  match '/plan/edit' => 'plans#edit', via: :get, as: :edit_plan
  match '/plan/update' => 'plans#update', via: [:put, :patch], as: :update_plan


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root "home#index"
end
