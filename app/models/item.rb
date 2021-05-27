class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

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
    validates :price, numericality:{ only_integer: true, message: "is invalid. Input half-width characters" }
  end
  validates :category_id,           numericality: { other_than: 1, message: "can't be blank" } 
  validates :status_id,             numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_charge_id,    numericality: { other_than: 1, message: "can't be blank"} 
  validates :delivery_day_id,       numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefectured_id,        numericality: { other_than: 1, message: "can't be blank" } 
end
