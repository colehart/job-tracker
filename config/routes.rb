Rails.application.routes.draw do
  resources :companies do
    resources :contacts
    resources :jobs
  end
  resources :categories

  resources :jobs, only: [:index, :new, :create] do
    resources :comments
  end
  get '/dashboard', to: 'dashboard#show', as:'dashboard'
  root to: 'dashboard#show'
end
