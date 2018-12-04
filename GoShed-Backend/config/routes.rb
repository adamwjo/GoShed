Rails.application.routes.draw do
  resources :homeworks
  resources :recordings
  resources :relationships
  resources :users
  resources :assignments
  resources :teachers
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post '/add_student', to: 'users#addStudent'
  post '/assign_homework', to: 'users#assign_homework'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
