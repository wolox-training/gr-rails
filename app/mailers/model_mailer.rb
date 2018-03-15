class ModelMailer < ApplicationMailer
  layout 'mailer'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def new_rent_notification(id)
    @rent = Rent.find(id)

    mail to: @rent.user.email, subject: 'New rent notification'
  end
end
