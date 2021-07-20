FactoryBot.define do
  factory :purchase_purchase_admin do
    token {'test'}
    phone_number {'12345678912'}
    building_name {'つくしが丘'}
    local_address {'5丁目-1-22番地'}
    local_position_town {'柏市'}
    delivery_local_id {2}
    post_number {'277-0072'}
  end
end
