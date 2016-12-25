Rails.application.routes.draw do
  resources :transactions
      Rails.application.routes.draw do
  resources :transactions
      devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
