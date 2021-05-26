class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivary_charge
  belongs_to :delivery_day
  belongs_to :prefecture

  with_options presence: true do
    validates :name
    validates :descriotion
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :delivery_day_id
    validates :prefectured_id
  end

  validates :price, numericality:{greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}

end
