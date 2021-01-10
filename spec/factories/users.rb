FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    gimei = Gimei.name
    last_name             { gimei.last.kanji }
    first_name            { gimei.first.kanji }
    last_furigana         { gimei.last.katakana }
    first_furigana        { gimei.first.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: 5.years.ago) }
  end
end
