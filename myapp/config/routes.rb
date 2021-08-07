require 'sidekiq/web'
Rails.application.routes.draw do
  get 'app_dashboard/index'
  get 'app_dashboard/data'
  get 'app_dashboard/stream_csv'
  post 'app_dashboard/process_data'
  
  root 'home#index'
  
  devise_for :users

  mount Sidekiq::Web => "/sidekiq"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
