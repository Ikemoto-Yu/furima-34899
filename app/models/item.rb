class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  with_options presence: true do
  validates :name
  validates :info
  validates :category_id
  validates :appearance_id
  validates :delivery_date_id
  validates :delivery_local_id
  validates :delivery_style_id
  validates :price
  end
end
