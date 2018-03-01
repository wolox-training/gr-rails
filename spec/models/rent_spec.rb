require 'faker'
describe Rent do
  subject(:rent) do
    Rent.new(user_id: user_id, book_id: user_id, from: from, to: to)
  end
  let(:user_id) { Faker::Number.between(1,1) } #Could be between 1 and Users.all.size
  let(:book_id) { Faker::Number.between(1,1) }
  let(:from)    { Faker::Date.backward(10) }
  let(:to)      { Faker::Date.forward(10)  }
  
  it do
    is_expected.to be_valid
  end
  
  describe '#create' do
    context 'when user_id is nil' do
      let(:user_id) { nil }
     
      it do
        is_expected.to be_invalid
      end
  end
 
  context 'when book_id is nil' do
    let(:book_id) { nil }

    it do
      is_expected.to be_invalid
    end
  end
end
 end
