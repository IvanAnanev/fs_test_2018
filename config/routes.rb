Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
  resources :feedbacks, only: %i[new create]

  namespace :admin do
    resources :feedbacks, only: %i[index show]
  end
end
