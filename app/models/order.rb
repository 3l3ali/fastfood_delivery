class Order < ApplicationRecord
  before_validation :set_bill

  belongs_to :user
  belongs_to :address

  has_and_belongs_to_many :items

  validates :bill, presence: true
  # validates :status, presence: true

  enum status: {
    being_prepared: 0,
    done: 1,
    out_for_delivery: 2
  }

  private

  def set_bill
    self.bill = self.items.map(&:price).inject(&:+)
  end
end
