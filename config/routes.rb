Rails.application.routes.draw do
  root "static#index"
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :stocks

  resources :users do
    resources :stocks
  end
  
  resources :categories
 

  
  

  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
