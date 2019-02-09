require 'sidekiq/web'

Rails.application.routes.draw do
  get 'members/create'
  get 'members/update'
  get 'members/destroy'
  get 'campaigns/show'
  get 'campaigns/index'
  get 'campaigns/create'
  get 'campaigns/update'
  get 'campaigns/destroy'
  get 'campaigns/raffle'
  get 'pages/home'
  devise_for :users, :controllers => { registrations: 'registrations' }
  mount Sidekiq::Web => '/sidekiq'
end