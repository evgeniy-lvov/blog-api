# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts, only: %i[create top] do
        get :top, on: :collection
      end
      resources :rates, only: %i[create]
      resources :user_ips, only: %i[single] do
        get :single, on: :collection
      end
    end
  end
end
