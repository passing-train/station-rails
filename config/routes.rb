Rails.application.routes.draw do
  get 'time_entries/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :time_entries, only: [:index, :update, :show, :create, :destroy] do
        get 'suggest', on: :collection
      end
    end
  end
end
