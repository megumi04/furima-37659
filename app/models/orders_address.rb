class OrdersAddress

  include ActiveModel::Model

  attr_accessor :post_code, :state_id, :city, :house_number, :apartment, :phone, :order, :user_id, :item_id

 validates :state_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :post_code, format: { with: /\A\[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, address: address, phone: phone, purchase_id: purchase.id)
  end

end 