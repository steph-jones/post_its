Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/about'
  root "static_pages#home"

  get "/about", to: "static_pages#about"

  resources :notes
end