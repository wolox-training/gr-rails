require 'rails_helper'
def mock_sign_in(user)
  allow_any_instance_of(described_class).to receive(:authenticate_user!)
  allow_any_instance_of(described_class).to receive(:current_user).and_return(user)
end

describe BooksController, type: :controller do
  context 'when user is logged in' do
    let!(:user) { create(:user) }
    context 'getting all the books' do
      before do
        mock_sign_in(User.last)
        get :index
      end
      let!(:books) { create_list(:book, 3) }
      it 'responds with the books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(response.body) =~ JSON.parse(expected)
      end
      it 'responds ok' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'getting a book' do
      let!(:book) { create(:book) }
      before do
        mock_sign_in(User.last)
        get :show, params: { id: book.id }
      end
      it 'responds with the book json' do
        book = create(:book)
        expected = BookSerializer.new(book, root: false).to_json
        expect(response.body) =~ JSON.parse(expected)
      end
      it 'responds ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
  context 'when user is not logged in' do
    context 'getting all the books' do
      it 'responds with 401' do
      end
    end
    context 'getting a single book' do
      it 'responds with 401' do
      end
    end
  end
end
