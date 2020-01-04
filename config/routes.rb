Rails.application.routes.draw do

  get 'dashboards/index'

  resources :sesion_colegios
  resources :tratamientos
  resources :tests
  resources :sesion_particulars
  resources :pacientes
  resources :cargos
  get 'pages/dashboard'
  root 'pages#index'
   devise_for :users, controllers: {

     registrations: 'users/registrations'
   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
