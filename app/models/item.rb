class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shippingfee
  belongs_to :prefecture
  belongs_to :deliveryschedule

  validates :name, :info, :price, presence: true
  validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_schedule_id, numericality: { other_than: 1 } 
end
