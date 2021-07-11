FactoryBot.define do
  factory :item do
    name           {Faker::Name.initials}
    info           {Faker::Lorem.sentence}
    category_id    {2}
    appearance_id  {2}
    delivery_style_id   {2}
    delivery_local_id   {2}
    delivery_date_id   {2}
    price          {450}

    association :user

    after(:build) do  |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
    end
end
