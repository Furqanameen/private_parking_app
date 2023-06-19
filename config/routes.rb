Rails.application.routes.draw do
  root 'slots#index'
  namespace :admin do
    resources :slots
    resources :reservations
    resources :users
    root to: 'slots#index'
  end
  # use_doorkeeper
  # use_doorkeeper do
  #   skip_controllers :authorizations, :applications, :authorized_applications
  # end
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :slots do
    member do
      get :book_slot
    end
  end

  resources :reservations do
    member do
      get :check_in
      get :check_out
    end
  end

  # namespace :api, defaults: { format: 'json' } do
  #   namespace :v1 do
  #     namespace :user do
  #       resources :users, only: %i[create]
  #     end
  #     namespace :customer do
  #       resources :customers do
  #         collection do
  #           get :get_filters_slots
  #           get :get_available_slots
  #           get :get_user_resevation
  #         end
  #       end
  #     end
  #   end
  # end
end
