class TradeAddress
  include ActiveModel::Model
  attr_accessor :phone_number, :postal_code, :prefectured_id, :city, :address, :building, :trade, :item, :user, :token


  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 333, less_than_or_equal_to: 99999999, message: 'is invalid'}
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number
    validates :prefectured_id
    validates :city
    validates :address
  end
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}


  def save
    trade = Trade.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefectured_id: prefectured_id, city: city, address: address, building: building, trade_id: trade.id)
  end
end