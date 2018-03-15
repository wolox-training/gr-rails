require 'rails_helper'

RSpec.describe ModelMailer, type: :mailer do
  describe 'new_rent_notification' do
    let!(:rent) { create(:rent) }
    let(:mail) { ModelMailer.new_rent_notification(rent.id) }

    it 'renders the headers' do
      expect(mail.subject).to eq('New rent notification')
    end

    it 'sends to the right user' do
      expect(mail.to).to eq([rent.user.email])
    end

    it 'is from correct mail' do
      expect(mail.from).to eq(['no-reply@wbooks.com.ar'])
    end
    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi, you just rented a book: \r\n\r\nBook:  ' +
                                         rent.book.title + '\r\n\r\nFrom:  ' + rent.from.to_s +
                                         '\r\nTo:    ' + rent.to.to_s + '\r\n\r\n\r\n')
    end
  end
end
