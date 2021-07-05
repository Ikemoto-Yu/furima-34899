FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'融'}
    last_name             {'池本'}
    first_name_kana       {'ユウ'}
    last_name_kana        {'イケモト'}
    birthday              {'1997-12-01'}
  end
end