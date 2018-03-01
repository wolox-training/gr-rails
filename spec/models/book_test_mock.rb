require 'database_cleaner'
require 'faker'
describe Book,type :model do
  #DatabaseCleaner.strategy = :truncation
  it do
    should validate_presence_of(:genre)
  end
  it do
    sould validate_presence_of(:title)
  end
  
  subject(:book) do
    Book.new(genre: genre, author: author, image: image, title: title,
             publisher: publisher, year: year)
  end
  let(:genre)     { Faker::Book.genre                }
  let(:author)    { Faker::Book.author               }
  let(:image)     { Faker::Food.description          }
  let(:title)     { Faker::Book.title                }
  let(:publisher) { Faker::Book.publisher            }
  let(:year)      { Faker::Number.between(1900,2018) }

  it do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'when genre is nil' do
      let(:genre) { nil }
      it do
        is_expected.to be_invalid
      end
    end
    
    context 'when author is nil' do
      let(:author) { nil }
      it do
        is_expected.to be_invalid
      end
    end
  end
  #DatabaseCleaner.clean
end
