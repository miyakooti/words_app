Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "questions#index"
  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  
  
  
  
  resources :users, only: :show
end
