require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  mount Sidekiq::Web => '/sidekiq'
  root to: 'pages#home'
  resources :campaigns, except: [:new] do
    post 'raffle', on: :member
  end

  get 'members/:token/opened', to: 'members#opened'
  resources :members, only:[:create, :destroy, :update]
end

