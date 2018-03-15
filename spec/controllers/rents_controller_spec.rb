require 'rails_helper'
def mock_sign_in(user)
  allow_any_instance_of(described_class).to receive(:authenticate_user!)
  allow_any_instance_of(described_class).to receive(:current_user).and_return(user)
end

describe RentsController, type: :controller do
  context 'when user is logged in' do
    let!(:user) { create(:user) }
    before do
      mock_sign_in(User.last)
    end
    context 'getting a rent' do
      let!(:rent) { create(:rent) }
      before do
        get :show, params: { id: rent.id, user_id: User.last.id }
      end
      it 'responds with the book json' do
        expected = RentSerializer.new(rent, root: false).to_json
        expect(response.body) =~ JSON.parse(expected)
      end
      it 'responds ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
