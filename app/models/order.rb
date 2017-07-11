class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_and_belongs_to_many :items

  validates :bill, presence: true
  validates :status, presence: true

  enum status: {
    being_prepared: 0,
    done: 1,
    out_for_delivery: 2
  }
end
