Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :carbon_footprints, path_names: { new: 'calculator' }
  get 'calculator', to: 'carbon_footprints#new'
  resources :examples
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
