class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :buyer

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :estimated_day

  validates :item_info, presence: true
  validates :item_name, presence: true
  validates :image, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 

  validates :delivery_charge_id, numericality: { other_than: 1 } 
  # validates :prefecture_id, numericality: { other_than: 1 } 
  validates :estimated_day_id, numericality: { other_than: 1 } 


  has_one_attached :image
end
