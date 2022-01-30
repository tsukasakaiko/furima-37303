FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '11111k' }
    password_confirmation { password }
    family_name           { 'てすと' }
    farst_name            { 'てすと' }
    family_name_kana      { 'テスト' }
    farst_name_kana       { 'テスト' }
    birth_day             { '1930-01-01' }
  end
end
