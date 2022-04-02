FactoryBot.define do
  factory :item do
    name { 'テスト' }
    item_text { 'テスト' }
    category_id         { '2' }
    status_id           { '2' }
    shopping_cost_id { '2' }
    state_id { '2' }
    shopping_day_id     { '2' }
    price               { '3000' }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
