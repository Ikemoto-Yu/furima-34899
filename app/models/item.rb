class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase_admin
  with_options presence: true do
  validates :image
  validates :name
  validates :info
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :appearance_id
      validates :delivery_date_id
      validates :delivery_local_id
      validates :delivery_style_id
    end
  validates :price ,  inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :appearance
  belongs_to :delivery_date
  belongs_to :delivery_style
  belongs_to :delivery_local
end
