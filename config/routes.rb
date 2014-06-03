Rails.application.routes.draw do
  resources :news_feeds

  namespace :users do
  	get 'omniauth_callbacks/facebook', as: "facebook_login"
  end

  root "home_pages#main"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
end
