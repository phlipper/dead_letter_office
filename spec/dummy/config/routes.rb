Rails.application.routes.draw do

  mount DeadLetterOffice::Engine => "/dead_letter_office"
end
