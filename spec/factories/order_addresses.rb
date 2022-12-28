FactoryBot.define do
  factory :order_address do
    postal_code {'399-0001'}
    prefecture_id {2}
    city {'大町市'}
    address {'大町7777-7'}
    building {'海沿タワー'}
    phone_number {'07055555555'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
