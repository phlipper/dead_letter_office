require "spec_helper"

describe DeadLetterOffice::DeadLetter do
  let(:dead_letter) { DeadLetterOffice::DeadLetter.new }

  it { dead_letter.must_respond_to :mailer }
  it { dead_letter.must_respond_to :message_id }
  it { dead_letter.must_respond_to :subject }
  it { dead_letter.must_respond_to :to }
  it { dead_letter.must_respond_to :from }
  it { dead_letter.must_respond_to :cc }
  it { dead_letter.must_respond_to :bcc }
  it { dead_letter.must_respond_to :date }
  it { dead_letter.must_respond_to :mail }
  it { dead_letter.must_respond_to :exception_name }
  it { dead_letter.must_respond_to :exception_message }

  describe "self.format_recipient" do
    let(:klass) { DeadLetterOffice::DeadLetter }
    let(:foo) { "foo@bar.com" }
    let(:baz) { "baz@qux.com" }

    it { klass.format_recipient(nil).must_equal "" }
    it { klass.format_recipient(foo).must_equal foo }
    it { klass.format_recipient([foo]).must_equal foo }
    it { klass.format_recipient([foo, baz]).must_equal "#{foo},#{baz}" }
  end

  describe "self.recover_parcel" do
    let(:time) { Time.now }
    let(:parcel) do
      {
        mailer: "AccountMailer",
        message_id: "4ffe140eb6437_cb943fc029834cd4793bb@WOPR.local.mail",
        subject: "Your Account Has Been Created",
        to: ["foo@bar.com", "baz@qux.com"],
        from: ["app@lvh.me"],
        date: time,
        mail: "Date: #{time}\r\nFrom: app@lvh.me\r\nTo: foo@bar.com, baz@qux.com\r\nMessage-ID: <4ffe140eb6437_cb943fc029834cd4793bb@WOPR.local.mail>\r\nSubject: Your Account Has Been Created\r\nMime-Version: 1.0\r\nContent-Type: text/plain;\r\n charset=UTF-8\r\nContent-Transfer-Encoding: 7bit\r\n\r\nHello,\r\n\r\nYour account has been successfully created.",
        exception: ["Errno::EHOSTDOWN", "Host is down - connect(2)"]
      }
    end

    before do
      @dead_letter_count = DeadLetterOffice::DeadLetter.count
      @dead_letter = DeadLetterOffice::DeadLetter.recover_parcel(parcel)
    end

    it { DeadLetterOffice::DeadLetter.count.must_equal @dead_letter_count + 1 }

    it { @dead_letter.mailer.must_equal "AccountMailer" }
    it { @dead_letter.message_id.must_equal "4ffe140eb6437_cb943fc029834cd4793bb@WOPR.local.mail" }
    it { @dead_letter.subject.must_equal "Your Account Has Been Created" }
    it { @dead_letter.to.must_equal "foo@bar.com,baz@qux.com" }
    it { @dead_letter.cc.must_equal "" }
    it { @dead_letter.bcc.must_equal "" }
    it { @dead_letter.from.must_equal "app@lvh.me" }
    it { @dead_letter.date.must_equal time }
    it { @dead_letter.mail.must_equal parcel[:mail] }
    it { @dead_letter.exception_name.must_equal "Errno::EHOSTDOWN" }
    it { @dead_letter.exception_message.must_equal "Host is down - connect(2)" }
  end
end
