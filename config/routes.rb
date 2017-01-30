Rails.application.routes.draw do
  get 'loans',                                    to: 'loans#index',      as: "loans"
  get 'loans/lend',                               to: 'loans#lend',       as: "lend_loans"
  get 'loans/lend_me',                            to: 'loans#lend_me',    as: "lend_me_loans"
  post 'loans/lend',                              to: 'loans#create_lend',as: "create_lend_loans"
  post 'loans/lend_me',                           to: 'loans#create_lend_me', as: "create_lend_me_loans"
  post 'loans/:id/finish',                        to: 'loans#finish',     as: "finish_loans"

  get     'admin',                                to: 'cdefaults#index',  as: "admin_index"
  get     'admin/defaults_categories/new',        to: 'cdefaults#new',    as: "new_cdefaults"
  post    'admin/defaults_categories/new',        to: 'cdefaults#create', as: "create_cdefaults"
  get     'admin/defaults_categories/:id/edit',   to: 'cdefaults#edit',   as: "edit_cdefaults"
  patch     'admin/defaults_categories/:id/edit', to: 'cdefaults#update', as: "update_cdefaults"
  delete  'admin/defaults_categories/:id',        to: 'cdefaults#destroy',as: "destroy_cdefaults"
  get     'transactions',                         to: 'transactions#index',as: "transactions"
  root    'transactions#general_analytics'
  post     'accounts/:id/select',                  to: 'accounts#select',  as: "select_account"
  resources :accounts
  resources :accounts do
    resources :transactions
  end
  resources :icategories
  resources :ecategories
  resources :expenses
  resources :incomes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
