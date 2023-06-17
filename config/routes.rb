Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#index"
  scope module: 'api', path: 'api' do
    resources :brands, only: %i[index show] do

    end
    resources :products, only: %i[index show] do

    end
  end
end
