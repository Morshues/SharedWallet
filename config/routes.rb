Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, :skip => [:registrations]

  root to: "home#index"

  resources :books, only: [:index, :create, :edit, :update] do
    post 'create_member', 'fetch_users', 'add_member'
  end
  get 'book/:token', to: 'books#book', as: 'book_token'

end
