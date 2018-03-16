require 'rails_helper'

RSpec.describe BookSuggestion, type: :model do
  subject(:book_suggestion) do
    create(:book_suggestion)
  end

  it do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'when author is nil' do
      it do
        book_suggestion.author = nil
        is_expected.to be_invalid
      end
    end

    context 'when title is nil' do
      it do
        book_suggestion.title = nil
        is_expected.to be_invalid
      end
    end
  end
end
