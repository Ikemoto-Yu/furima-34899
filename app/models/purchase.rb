class Purchase < ApplicationRecord
  attr_accessor :token
  belongs_to :purchase_admin
end
