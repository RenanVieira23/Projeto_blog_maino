Rails.application.routes.draw do
  devise_for :authors
  resources :posts do
    resources:comentarios
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "posts#index"

end
