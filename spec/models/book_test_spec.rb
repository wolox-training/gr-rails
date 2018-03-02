require 'database_cleaner'
require 'faker'
describe Book do

  subject(:book) do
    build(:book)
  end

  it do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'when genre is nil' do
      it do
        book.genre = nil
        is_expected.to be_invalid
      end
    end

    context 'when author is nil' do
      it do
        book.author = nil
        is_expected.to be_invalid
      end
    end
  end
end
