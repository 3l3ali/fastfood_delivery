class Address < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :nullify

  validates :city, presence: true
  validates :state, presence: true
  validates :building, presence: true
  validates :zipcode, presence: true
  validates_format_of :zipcode, :with => /\A\d{5}\Z/i
end

