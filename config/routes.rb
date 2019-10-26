Rails.application.routes.draw do
  resources :sesion_colegios
  resources :tratamientos
  resources :tests
  resources :sesion_particulars
  resources :pacientes
  resources :cargos
   devise_for :users, controllers: {
     sessions: 'users/sessions'
   }
   asddasdasasd
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
