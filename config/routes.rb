Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :projects, only: [:index, :show, :new, :create, :edit, :update]
  get '/project/:id', to: 'projects#unpublish', as: 'unpublish'
end
