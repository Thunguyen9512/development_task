Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  require 'sidekiq/web'

  Rails.application.routes.draw do
    mount Sidekiq::Web => '/sidekiq'
  end

  scope module: 'api', path: 'api' do
    resources :brands, only: %i[index show] do

    end
    resources :products, only: %i[index show] do

    end

    resources :cards, only: %i[show] do
      collection do
        post :issued
      end
    end
  end
end
