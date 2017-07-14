class Item < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :name , presence: true
  validates :price , presence: true
  validates :category , presence: true

  enum category: {
    burgers: 0,
    chicken_sandwiches: 1,
    salads: 2,
    sides: 3,
    drinks: 4,
    shakes: 5
  }

  def self.items_for_select
    categories.to_a.unshift(["all",""])
  end
end
