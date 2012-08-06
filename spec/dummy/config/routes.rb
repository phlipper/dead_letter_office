Rails.application.routes.draw do

  mount DeadLetterOffice::Engine => "/dead_letter_office"

  namespace :dead_letter_office do
    get "dead_letters", to: "dead_letters#index"
    delete "dead_letters/:id", to: "dead_letters#destroy"
  end
end
