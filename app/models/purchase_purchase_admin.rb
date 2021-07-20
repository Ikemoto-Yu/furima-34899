class PurchasePurchaseAdmin
  include ActiveModel::Model
  attr_accessor :item_id,:user_id,:phone_number,:building_name, :local_address, :local_position_town, :delivery_local_id, :post_number, :token
  with_options presence: true do
    validates :token
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :local_address
    validates :local_position_town
    validates :delivery_local_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :post_number, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :user_id
    validates :item_id
    end

    def save
      purchase_admin = PurchaseAdmin.create(item_id: item_id, user_id: user_id)
      Purchase.create(phone_number: phone_number, building_name: building_name, local_address: local_address, local_position_town: local_position_town, delivery_local_id: delivery_local_id, post_number: post_number, purchase_admin_id: purchase_admin.id)
    end
end