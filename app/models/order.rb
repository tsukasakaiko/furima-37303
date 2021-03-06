class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_code, :prefecture_id, :city, :address, :building_name, :phone

  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token

    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    SendingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city,
                          address: address, building_name: building_name, phone: phone, buyer_id: buyer.id)

   
  end
end
