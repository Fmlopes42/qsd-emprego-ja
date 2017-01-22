Rails.application.routes.draw do
  root 'welcome#index'
  resources :jobs, only: [:create, :show, :new]
end
