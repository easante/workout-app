Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: "dashboard#index"

  resources :users do
    resources :exercises
  end
end
