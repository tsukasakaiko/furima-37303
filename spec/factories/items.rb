FactoryBot.define do
  factory :item do
    association :user
    category_id               { '2' }
    condition_id              { '2' }
    delivery_charge_id        { '2' }
    prefecture_id             { '2' }
    estimated_day_id          { '2' }
    price                     { '1000' }
    item_info                 { 'テスト' }
    item_name                 { 'テスト' }

    after(:build) do |item_image|
      item_image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
