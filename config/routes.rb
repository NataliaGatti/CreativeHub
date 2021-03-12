Rails.application.routes.draw do
  devise_for :users
  # resource :user do
  # end
  
  root to: 'pages#home'
  resources :projects, only: [:index, :show, :new, :create, :edit, :update] do
    resources :favourite_projects, only: [:create]
    resources :postulations, only: [:index, :show, :new, :create] do
      resources :reviews, only: [:new, :create]
    end
    resources :chatrooms, only: :create
  end
  
  resources :categories, only: [:index, :new, :create]
  delete '/favourite_projects/:id', to: "favourite_projects#destroy", as: 'favourite_project'
  get '/favourite_projects', to: "favourite_projects#index_by_user", as: 'favourite_projects'
  get '/project/:id', to: 'projects#unpublish', as: 'unpublish'
  get '/projectsbycategory/', to: 'projects#projects_by_category', as: 'projects_by_category'
  patch '/project/:id/postulations/accept', to: 'postulations#accept_project', as: 'accept_project'
  patch '/project/:id/postulations/decline', to: 'postulations#decline_project', as: 'decline_project'

  get '/my_projects', to: 'projects#index_by_user_company', as: 'my_projects'
  put '/my_projects/:id', to: 'projects#unpublish_project_by_user_company', as: 'unpublish_project'
  get '/my_projects/:id/postulations', to: 'projects#my_projects_postulations', as: 'my_projects_postulations'
  patch '/my_projects/:id/postulations/:postulation_id', to: 'projects#change_projects_postulations_state', as: 'change_projects_postulations_state'

  get '/my_postulations', to: 'postulations#my_postulations', as: 'my_postulations'
  get '/chat', to: 'projects#chat', as: 'chat'  
  # get '/postulations/:id/review', to: 'reviews#new', 

  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  # me crea la ruta /chatrooms/1/messages -> POST
  end
end
