class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :name, :name_reading, :nickname, :postal_code, :prefecture, :city, :house_number, :phone_number, :building_name, :price, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: { other_than: 0, message: "Select" }
    validates :city
    validates :house_number
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A\d{11}\z/, message: 'Contains hyphen(-)' }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    ShippingAddress.create(order_id: order.id, postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end

end