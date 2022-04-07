FactoryBot.define do
  factory :order_address do
    post_code      { '123-4567' }
    state_id       { Faker::Number.between(from: 1, to: 47) }
    city           { Faker::Address.city }
    house_number   { Faker::Address.street_address }
    apartment      { Faker::Hobby.activity }
    phone          { '09022222222' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
