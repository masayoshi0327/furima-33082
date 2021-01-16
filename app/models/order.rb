class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone
    validates :user
    validates :item
  end
end
