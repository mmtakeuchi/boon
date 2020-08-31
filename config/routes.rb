Rails.application.routes.draw do
  root "static#index"
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :stocks

  resources :categories do
    resources :stocks
  end

 


  

  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
