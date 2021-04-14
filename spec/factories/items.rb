FactoryBot.define do
  factory :item do
    name                 { 'samplename' }
    info                 { 'sampleinfo' }
    category_id          { 2 }
    status_id            { 2 }
    shipping_fee_id      { 2 }
    prefecture_id        { 2 }
    delivery_schedule_id { 2 }
    price                { 1000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/aiueo.png'), filename: 'aiueo.png')
    end
  end
end
