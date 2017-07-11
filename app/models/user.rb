class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :addresses
  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates_format_of :phone_number, :with => /\A\d{10}\Z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  enum role: {
    manager: 0,
    employee: 1,
    delivery_guy: 2,
    customer: 3
  }

  def self.roles_for_select
    roles.to_a.unshift(["all", ""])
  end
end
