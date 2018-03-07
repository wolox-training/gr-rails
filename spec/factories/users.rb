FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password         { Faker::Internet.password(8) }
    last_name        { Faker::Name.unique.first_name }
    first_name       { Faker::Name.last_name }
  end
end
