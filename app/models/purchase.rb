class Purchase < ApplicationRecord
  attr_accessor :token
  with_options presence: true do
   validates :token
   validates :phone_number
   validates :building_name
   validates :local_address
   validates :local_position_town
   validates :delivery_local_id, numericality: { other_than: 1, message: "can't be blank" }
   validates :post_number
end
