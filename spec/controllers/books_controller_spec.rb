require 'rails_helper'

describe BooksController, type: :controller do
  context 'when user is logged in' do
    let!(:user) { create(:user) }
    before do
      mock_sign_in(User.last)
    end
    context 'getting all the books' do
      before do
        get :index
      end
      let!(:books) { create_list(:book, 3) }
      it 'responds with the books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, serializer: CompleteBookSerializer
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
        get :show, params: { id: book.id }
      end
      it 'responds with the book json' do
        book = create(:book)
        expected = SingleBookSerializer.new(book, root: false).to_json
        expect(response.body) =~ JSON.parse(expected)
      end
      it 'responds ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
  context 'when user is not logged in' do
    context 'getting all the books' do
      let!(:book) { create(:book) }
      before do
        get :show, params: { id: book.id }
      end
      it 'responds with 401' do
        expect(response).to have_http_status(:found)
      end
    end
    context 'getting a single book' do
      before do
        get :index
      end
      it 'responds with 401' do
        expect(response).to have_http_status(:found)
      end
    end
  end
end
