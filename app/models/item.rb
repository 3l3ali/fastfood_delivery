class Item < ApplicationRecord
  enum category: {
    burgers: 0,
    chicken_sandwiches: 1,
    salads: 2,
    sides: 3,
    drinks: 4,
    shakes: 5
  }
end
