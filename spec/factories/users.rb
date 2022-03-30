FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             { japanese_user.last.kanji }
    first_name            { japanese_user.first.kanji }
    last_name_ruby        { japanese_user.last.katakana }
    first_name_ruby       { japanese_user.first.katakana }
    birthday              { '1988-01-01' }
  end
end