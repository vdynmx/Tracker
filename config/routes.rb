Rails.application.routes.draw do
  get 'tracks/index'

  get 'tracks/show'

  get 'tracks/new'

  get 'tracks/edit'

  get 'tracks/delete'

  mount_devise_token_auth_for 'User', at: 'auth'
  ##devise_for :users

  resources :tracks
  root to: "track#index"
end
