class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  with_options presence: true do
  validates :name
  validates :info
  validates :category_id , numericality: { other_than: 1, message: "can't be blank" } 
  validates :appearance_id , numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_date_id
  validates :delivery_local_id
  validates :delivery_style_id
  validates :price
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
