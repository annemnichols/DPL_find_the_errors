Rails.application.routes.draw do
  root 'static_pages#home'
  #Reformat 'static_pages_about path'
  get '/about', to: 'static_pages#about', as: :about

  resources :posts
  resources :tasks

end
