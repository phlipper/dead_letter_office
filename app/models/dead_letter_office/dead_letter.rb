require "mail"

module DeadLetterOffice
  class DeadLetter < ActiveRecord::Base
    attr_accessible :mailer, :message_id, :subject, :date, :mail

    def self.recover_parcel(parcel)
      payload = parcel.dup
      ex_name, ex_message = *payload.delete(:exception)

      to   = format_recipient(payload.delete(:to))
      cc   = format_recipient(payload.delete(:cc))
      bcc  = format_recipient(payload.delete(:bcc))
      from = format_recipient(payload.delete(:from))
      mail = ::Mail.new(payload.delete(:mail)).body.decoded
      date = payload.delete(:date) || Time.zone.now

      new(payload) do |dead_letter|
        dead_letter.to = to
        dead_letter.cc = cc
        dead_letter.bcc = bcc
        dead_letter.from = from
        dead_letter.mail = mail
        dead_letter.date = date
        dead_letter.exception_name = ex_name
        dead_letter.exception_message = ex_message
        dead_letter.save
      end
    end

    def self.format_recipient(recipient)
      Array.wrap(recipient).join(",")
    end
  end
end
