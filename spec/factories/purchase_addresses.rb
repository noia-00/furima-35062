FactoryBot.define do
  factory :purchase_address do
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    city           { '横浜市中区' }
    address_line_1 { '中野町 1-1-1' }
    address_line_2 { 'ナカノビル111' }
    phone_number   { '08011111111' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
