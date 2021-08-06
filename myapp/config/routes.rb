Rails.application.routes.draw do
  get 'app_dashboard/index'
  get 'app_dashboard/data'
  root 'home#index'
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
