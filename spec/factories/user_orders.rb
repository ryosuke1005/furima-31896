FactoryBot.define do
  factory :user_order do
    postal_code {'123-4567'}
    prefecture {1}
    city {'さいたま'}
    house_number {'1丁目'}
    phone_number {'09012345678'}

    association :user
    association :item
  end
end