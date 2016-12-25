Rails.application.routes.draw do
  get 'income/new'

  get 'income/create'

  get 'income/edit'

  get 'income/update'

  get 'income/delete'

  resources :transactions
      Rails.application.routes.draw do
  get 'income/new'

  get 'income/create'

  get 'income/edit'

  get 'income/update'

  get 'income/delete'

  resources :transactions
      devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
