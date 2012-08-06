require "minitest_helper"

describe DeadLetterOffice::DeadLettersController do
  before { DeadLetterOffice::DeadLetter.delete_all }

  let(:dead_letter) do
    DeadLetterOffice::DeadLetter.new do |dl|
      dl.mailer  = "TestMailer"
      dl.from    = "foo@bar.com"
      dl.to      = "baz@qux.com"
      dl.subject = "Test Subject"
      dl.save
    end
  end

  describe "GET index" do
    before do
      dead_letter
      get :index
    end

    it { response.status.must_equal 200 }

    it { response.body.must_match "Dead Letter Office" }
    it { response.body.must_match "Mailer" }
    it { response.body.must_match "To" }
    it { response.body.must_match "Subject" }

    it { assigns[:dead_letters].must_include dead_letter }

    it { response.body.must_match "TestMailer" }
    it { response.body.must_match "baz@qux.com" }
    it { response.body.must_match "Test Subject" }
  end

  describe "DELETE destroy" do
    before { dead_letter }

    describe "HTML format" do
      before { delete :destroy, id: dead_letter.id }

      it { response.status.must_equal 302 }
      it { response.header["Location"].must_match "/dead_letters" }
    end

    describe "JS format" do
      before { delete :destroy, id: dead_letter.id, format: :js }

      it { response.status.must_equal 200 }
      it { response.body.must_match "row_dead_letter_#{dead_letter.id}" }
      it { response.body.must_match "Dead Letter has been removed." }
    end
  end
end
