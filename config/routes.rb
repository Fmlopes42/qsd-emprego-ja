Rails.application.routes.draw do
  root 'welcome#index'
  resources :jobs, only: [:index, :show, :new, :create, :edit, :update]
  resources :companies, only: [:new, :create, :show]
end
