class Address < ApplicationRecord

  belongs_to :trade
  
  with_options presence: true do
    validates :phone_number
    validates :postal_code
    validates :prefectured_id
    validates :city
    validates :address
  end


end
