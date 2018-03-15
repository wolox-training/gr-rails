FactoryBot.define do
  factory :rent do
    user
    book
    from        { Faker::Date.backward(10) }
    to          { Faker::Date.between(5.days.from_now, 10.days.from_now) }
    returned_at { Faker::Date.forward(5) }
  end
end
