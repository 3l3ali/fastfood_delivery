class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_many :itemsOrders
  has_many :items, through: :itemsOrders
end
