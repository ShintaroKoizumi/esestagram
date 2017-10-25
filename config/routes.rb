Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pics do
    resources :comments
  end
  resources :favorites, only: [:create, :destroy]
  root "pics#index"
  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/favorites', to: 'profiles#favorites', as: :user_favorites
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile
end
