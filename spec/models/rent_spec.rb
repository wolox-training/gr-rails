require 'faker'
describe Rent do
  DatabaseCleaner.strategy = :truncation
  include FactoryBot::Syntax::Methods
  subject(:rent) do
    build(:rent)
  end

  it do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'when from is nil' do
      it do
        rent.from = nil
        is_expected.to be_invalid
      end
    end

    context 'when to is nil' do
      it do
        rent.to = nil
        is_expected.to be_invalid
      end
    end
  end
  DatabaseCleaner.clean
end
