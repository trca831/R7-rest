Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users,
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
                controllers: {
                  sessions: 'users/sessions',
                  registrations: 'users/registrations'
              }
  # Defines the root path route ("/")
  # root "articles#index"
  get '/test', to: 'test#show'

  namespace :api do
    namespace :v1 do
      resources :members do
        resources :facts
      end
    end
  end

end 
