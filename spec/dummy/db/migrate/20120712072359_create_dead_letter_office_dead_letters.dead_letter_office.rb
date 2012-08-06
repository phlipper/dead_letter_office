# This migration comes from dead_letter_office (originally 20120712054220)
class CreateDeadLetterOfficeDeadLetters < ActiveRecord::Migration
  def change
    create_table :dead_letter_office_dead_letters do |t|
      t.string :mailer
      t.string :message_id
      t.string :subject
      t.string :to
      t.string :from
      t.string :cc
      t.string :bcc
      t.time   :date
      t.text   :mail
      t.string :exception_name
      t.string :exception_message

      t.timestamps
    end
  end
end
