class MailerWorker
  include Sidekiq::Worker

  def perform(id)
    ModelMailer.new_rent_notification(id).deliver
  end
end
