FactoryBot.define do
  factory :order do
    token         {"tok_abcdefghijk00000000000000000"}

    numA = Faker::Number.number(digits: 3)
    numB = Faker::Number.number(digits: 4)

    postal_code   {"#{numA}-#{numB}"}
    prefecture_id {Faker::Number.within(range: 1..47)}
    city          {Gimei.address.city.kanji}
    house_number  {Faker::Lorem.word}
    building      {Faker::Lorem.word}
    phone         {Faker::Number.leading_zero_number(digits: 11)}
    association :item
    user { item.user }
  end
end
