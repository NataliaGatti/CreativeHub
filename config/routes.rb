Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :projects, only: [:index, :show, :new, :create, :edit, :update] do
  resources :postulations, only: [:index, :show, :new, :create]
  end

  resources :categories, only: [:index, :new, :create]

  get '/project/:id', to: 'projects#unpublish', as: 'unpublish'
  get '/projectsbycategory', to: 'projects#projects_by_category', as: 'projects_by_category'
  patch '/project/:id/postulations/accept', to: 'postulations#accept_project', as: 'accept_project'
  patch '/project/:id/postulations/decline', to: 'postulations#decline_project', as: 'decline_project'
end
