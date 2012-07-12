module DeadLetterOffice
  class DeadLetter < ActiveRecord::Base
    attr_accessible :mailer, :message_id, :subject, :date, :mail

    def self.recover_parcel(parcel)
      ex_name, ex_message = *parcel.delete(:exception)

      to   = format_recipient(parcel.delete(:to))
      cc   = format_recipient(parcel.delete(:cc))
      bcc  = format_recipient(parcel.delete(:bcc))
      from = format_recipient(parcel.delete(:from))

      new(parcel) do |dead_letter|
        dead_letter.to = to
        dead_letter.cc = cc
        dead_letter.bcc = bcc
        dead_letter.from = from
        dead_letter.exception_name = ex_name
        dead_letter.exception_message = ex_message
        dead_letter.save
      end
    end

    def self.format_recipient(recipient)
      Array(recipient).join(",")
    end
  end
end
