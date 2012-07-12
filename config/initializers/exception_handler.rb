ActiveSupport::Notifications.subscribe "deliver.action_mailer" do |name, start, finish, id, payload|
  if payload[:exception]
    DeadLetterOffice::DeadLetter.recover_parcel(payload)
  end
end
