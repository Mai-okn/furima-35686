class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.string  :phone_number,          null: false
      t.string  :postal_code,           null: false
      t.integer :prefectured_id,        null: false
      t.string  :city,                  null: false
      t.string  :address,               null: false
      t.string  :building
      t.references :trade,              foreign_key: true

      t.timestamps
    end
  end
end
