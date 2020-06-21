Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users,　controllers: { registrations: 'users/registrations' }
  resources :users, only: [:index, :edit, :update]
  resources :posts, only: [:index, :new, :create, :show, :edit, :update] do
    resources :comments, only: :create
  end

end
 