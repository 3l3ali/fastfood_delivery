class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_many :itemsOrders
  has_many :items, through: :itemsOrders

  enum status: {
    being_prepared: 0,
    done: 1,
    out_for_delivery: 2
  }
end
