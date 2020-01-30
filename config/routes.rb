Rails.application.routes.draw do

  resources :contactos
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'dashboards/index'

  resources :sesion_colegios
  resources :tratamientos
  resources :tests
  resources :sesion_particulars
  resources :pacientes do
    resources :sesion_particulars
    resources :tests
    resources :tratamientos do
      resources :sesion_colegios
    end
  end
  resources :cargos
  get 'pages/dashboard'
  root 'pages#index'
   devise_for :users, controllers: {

     registrations: 'users/registrations'
   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
