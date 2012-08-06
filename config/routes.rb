DeadLetterOffice::Engine.routes.draw do
  resources :dead_letters, only: [:index, :destroy]
  root to: "dead_letters#index"
end
