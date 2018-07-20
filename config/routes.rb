Rails.application.routes.draw do
  get 'users/new'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sessions/new'
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'	
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'test', to: 'static_pages#test'
  post 'add_intake', to: 'users#add_intake'
  post 'reveal_intake', to: 'users#reveal_intake'
  post 'reveal_height', to: 'users#reveal_height'
  post 'reveal_weight', to: 'users#reveal_weight'
  post 'add_height_weight', to: 'users#add_height_weight'
  post 'add_comment', to: 'users#add_comment'
  post 'add_comment', to: 'users#add_comment.json'
  post 'reveal_posts', to: 'users#reveal_posts'
end
