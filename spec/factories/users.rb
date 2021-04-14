FactoryBot.define do
  factory :user do
    nickname              { 'sampleuser' }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    password_confirmation { 'abc123' }
    lastname              { '山田' }
    firstname             { '太郎' }
    lastname_kana         { 'ヤマダ' }
    firstname_kana        { 'タロウ' }
    birthday              { '1995-05-04' }
  end
end
