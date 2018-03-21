require 'rails_helper'

describe BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    context 'When creating a valid book suggestion' do
      let!(:book_suggestion) { create(:book_suggestion) }
      before do
        post :create, params: { author: book_suggestion.author, title: book_suggestion.title,
                                link: book_suggestion.link }
      end
      it 'creates the book suggestion' do
        expect(BookSuggestion.last).not_to eq(book_suggestion)
      end

      it 'responds with 201 status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid book suggestion' do
      let!(:book_suggestion) { create(:book_suggestion) }
      before do
        post :create, params: { author: book_suggestion.author, title: book_suggestion.title }
      end
      it 'doesn\'t create a new rent' do
        expect(BookSuggestion.last).to eq(book_suggestion)
      end

      it 'returns error messages' do
        expect(response.body['link']).to be_present
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
