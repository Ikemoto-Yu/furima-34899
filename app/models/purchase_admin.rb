class PurchaseAdmin < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :purchase_admin
end
