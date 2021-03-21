Rails.application.routes.draw do
<<<<<<< Updated upstream
=======
  devise_for :users
>>>>>>> Stashed changes
  root to: 'items#index'
  resources :items, only: [:index, :new, :create]
end
