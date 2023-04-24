Rails.application.routes.draw do
  root to: "posts#index"
  resources :tags
  devise_for :authors
  resources :posts do
    resources:comentarios
    resources :profile, only: [:show, :edit, :update]
  end

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  

end
