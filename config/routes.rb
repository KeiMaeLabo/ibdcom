Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:index, :edit, :update, :show]
  resources :posts, only: [:index, :new, :create, :show, :edit, :update] do
    resources :comments, only: :create
    get :search, on: :collection
  end

end
 