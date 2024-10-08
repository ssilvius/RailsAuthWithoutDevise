Rails.application.routes.draw do
  get "/dashboard" => "dashboard#index"
  root "marketing#index"

  get "/register" => "registration#new"
  post "/register" => "registration#create"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
