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
    context 'getting all the rents' do
      before do
        get :index, params: { user_id: user.id }
      end
      let!(:rents) { create_list(:rent, 3, user: user) }
      it 'responds with the rents json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          rents, each_serializer: RentSerializer
        ).to_json
        expect(response.body) =~ JSON.parse(expected)
      end
      it 'responds ok' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'getting a rent' do
      let!(:rent) { create(:rent, user: user) }
      before do
        get :show, params: { id: rent.id, user_id: user.id }
      end
      it 'responds with the rent json' do
        expected = RentSerializer.new(rent, root: false).to_json
        expect(response.body) =~ JSON.parse(expected)
      end
      it 'responds ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  context 'when user is not logged in' do
    let!(:user) { create(:user) }
    context 'getting all the books' do
      let!(:rent) { create(:rent) }
      before do
        get :show, params: { id: rent.id, user_id: user.id }
      end
      it 'responds with 302' do
        expect(response).to have_http_status(:found)
      end
    end
    context 'getting a single book' do
      before do
        get :index, params: { user_id: user.id }
      end
      it 'responds with 401' do
        expect(response).to have_http_status(:found)
      end
    end
  end
end
