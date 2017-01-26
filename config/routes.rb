Rails.application.routes.draw do

  get     'admin',                              to: 'cdefaults#index',  as: "admin_index"
  get     'admin/defaults_categories/new',      to: 'cdefaults#new',    as: "new_cdefaults"
  post    'admin/defaults_categories',          to: 'cdefaults#create', as: "create_cdefaults"
  get     'admin/defaults_categories/:id/edit', to: 'cdefaults#edit',   as: "edit_cdefaults"
  put     'admin/defaults_categories/:id',      to: 'cdefaults#update', as: "update_cdefaults"
  delete  'admin/defaults_categories/:id',      to: 'cdefaults#destroy',as: "destroy_cdefaults"
  root    'transactions#index'
  resources :expenses
  resources :incomes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
