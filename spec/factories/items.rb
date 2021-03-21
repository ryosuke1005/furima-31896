FactoryBot.define do
  factory :item do
    name                      {"iphone"}
    explain                   {"aaa"}
    price                     {3000}
    status_id                 {1}
    postage_id                {1}
    prefecture_id             {1}
    shipping_date_id          {1}
    category_id               {1}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
