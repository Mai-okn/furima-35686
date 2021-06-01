class TradeAddress
  include ActiveModel::Model
  attr_accessor :phone_number, :postal_code, :prefectured_id, :city, :address, :building, :item_id, :user_id, :token


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :phone_number, numericality:{ only_integer: true, message: "is invalid. Input only number" }
    validates :prefectured_id
    validates :city
    validates :address
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :prefectured_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :phone_number, format:{with: /\A\d{10,11}\z/, message: "is too short"}

  def save
    trade = Trade.create(item_id: item_id, user_id: user_id)
    Address.create(phone_number: phone_number, postal_code: postal_code, prefectured_id: prefectured_id, city: city, address: address, building: building, trade_id: trade.id)
  end
end