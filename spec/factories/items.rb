FactoryBot.define do
  factory :item do
    name              { Faker::String.random(length: [1..40]) }
    description       { Faker::String.random(length: [1..1000]) }
    category_id       { Faker::Number.between(from: 1, to: 10) }
    condition_id      { Faker::Number.between(from: 1, to: 6) }
    delivery_fee_id   { Faker::Number.between(from: 1, to: 2) }
    sender_id         { Faker::Number.between(from: 1, to: 47) }
    delivery_days_id  { Faker::Number.between(from: 1, to: 3) }
    price             { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
