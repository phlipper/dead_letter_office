require_dependency "dead_letter_office/application_controller"

module DeadLetterOffice
  class DeadLettersController < ApplicationController
    def index
      @dead_letters = DeadLetter.scoped
    end

    def destroy
      @dead_letter = DeadLetter.find(params[:id])
      @dead_letter.destroy

      respond_to do |wants|
        wants.js
        wants.html do
          redirect_to dead_letters_path, notice: "Dead Letter has been removed."
        end
      end
    end
  end
end
