Rails.application.routes.draw do

  devise_scope :doctor do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_doctor_registration" # custom path to sign_up/registration
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :doctors, path: 'doctors', controllers: { sessions: "doctors/sessions", registrations: "doctors/registrations"}, 
              :skip => [:registrations] 
              as :doctor do
              get 'doctors/edit' => 'devise/registrations#edit', :as => 'edit_doctor_registration'
              put 'doctors' => 'devise/registrations#update', :as => 'doctor_registration'
              end

  devise_for :patients, path: 'patients', controllers: { sessions: "patients/sessions", registrations: "patients/registrations"}
  
  root "welcome#index"

  resources :appointments
  resources :patients, only: [:index, :show]
  resources :doctors, only: [:index, :show, :profile]
  #root :to => 'appointments#index', :constraints => lambda { |request| request.env['warden'].user.class.name == 'Doctor' }, :as => "doctor_root"
  #root :to => 'appointments#index', :constraints => lambda { |request| request.env['warden'].user.class.name == 'Patient' }, :as => "patient_root"
  resources :categories, except: [:destroy]

end
