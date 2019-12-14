Rails.application.routes.draw do
  get 'pages/index'

  resources :sesion_colegios
  resources :tratamientos
  resources :tests
  resources :sesion_particulars
  resources :pacientes
  resources :cargos
  root "pages#index"
   devise_for :users, controllers: {
     sessions: 'users/sessions'
   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
