class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :trade

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :delivery_day
  belongs_to :prefectured

  with_options presence: true do
    validates :image
    validates :name  
    validates :description
    validates :price, numericality:{greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end
  
  validates :price, numericality:{ only_integer: true, message: "is invalid. Input half-width characters" }
  
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :delivery_day_id
    validates :prefectured_id
  end

end
