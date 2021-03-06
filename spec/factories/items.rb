FactoryBot.define do
  factory :item do
    name                {"タイトル"}
    description         {"詳細"}
    price               {3000}
    category_id         {2}
    status_id           {2}
    delivery_charge_id  {2}
    delivery_day_id     {2}
    prefectured_id      {2}
    association :user

    after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
