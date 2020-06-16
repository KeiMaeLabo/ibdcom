Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users,　controllers: { registrations: 'users/registrations' }
  resources :users, only: [:index, :edit, :update]

end
