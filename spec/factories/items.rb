FactoryBot.define do
  factory :item do
    name {'りんご'}
    description {'赤い'}
    category_id {3}
    item_status_id {3}
    shopping_cost_id {3}
    prefecture_id {3}
    shopping_date_id {3}
    price {'5000'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
