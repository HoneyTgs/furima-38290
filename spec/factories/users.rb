FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {'飯沢'}
    first_name {'祐也'}
    last_name_kana {'イイザワ'}
    first_name_kana {'ユウヤ'}
    birth_day{'1987-11-11'}
  end
end