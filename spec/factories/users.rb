FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {'向日葵'}
    first_name {'夏美'}
    last_name_kana {'ヒマワリ'}
    first_name_kana {'ナツミ'}
    birth_day{'1987-11-11'}
  end
end