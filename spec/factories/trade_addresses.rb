FactoryBot.define do
  factory :trade_address do
    postal_code { '123-4567' }
    prefectured_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09011112222' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
