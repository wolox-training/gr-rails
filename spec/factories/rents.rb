FactoryBot.define do
  factory :rent do
    user
    book
    from    { Faker::Date.backward(10) }
    to      { Faker::Date.forward(10)  }
  end
end
