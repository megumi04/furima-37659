class OrderAddress
  include ActiveModel::Model
  attr_accessor :token
  attr_accessor :post_code, :state_id, :city, :house_number, :apartment, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :house_number
    validates :token
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :phone, format: { with: /\A\d{10,11}\z/ }
    validates :state_id, numericality: { other_than: 0 }

  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, state_id: state_id, city: city, house_number: house_number, phone: phone,
                   order_id: order.id)
  end
end

