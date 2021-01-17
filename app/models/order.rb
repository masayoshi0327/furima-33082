class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A\d{11}\z/ }
    validates :user
    validates :item
  end
end
