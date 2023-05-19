Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :members, only: [:index, :show ,:create, :update, :destroy]
  #get "/members", to: " members#index"

  match '/members', to: 'members#handle_options', via: :options



end
