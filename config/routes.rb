Rails.application.routes.draw do
  root 'transactions#index'
  resources :expense
  resources :income
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
