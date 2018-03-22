FactoryBot.define do
  factory :book_suggestion do
    editorial { Faker::ElderScrolls.dragon        }
    price     { Faker::Number.between(30, 80)     }
    author    { Faker::Book.author                }
    title     { Faker::Book.title                 }
    link      { Faker::Food.description           }
    publisher { Faker::Book.publisher             }
    year      { Faker::Number.between(1900, 2018) }
    user_id   { create(:user).id                  }
  end
end
