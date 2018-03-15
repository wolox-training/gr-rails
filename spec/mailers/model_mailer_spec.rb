require 'rails_helper'

RSpec.describe ModelMailer, type: :mailer do
  describe 'new_rent_notification' do
    let!(:rent) { create(:rent) }
    let(:mail) { ModelMailer.new_rent_notification(rent.id) }

    it 'renders the headers' do
      expect(mail.subject).to eq('New rent notification')
      expect(mail.to).to eq([rent.user.email])
      expect(mail.from).to eq(['no-reply@wbooks.com.ar'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
