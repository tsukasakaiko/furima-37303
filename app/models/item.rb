class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :buyer

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :estimated_day

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 } 
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank" }  


  has_one_attached :image
end
