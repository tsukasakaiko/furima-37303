FactoryBot.define do
  factory :order do
    post_code           { '123-4567' }
    prefecture_id       { '5' }
    city                { '中央区' }
    address             { '八丁堀1' }
    building_name       { '森ビル' }
    phone               { '09011112222' }
    
  end

end
