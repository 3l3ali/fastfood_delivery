# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
User.destroy_all
puts "creating items.."

items_attributes = [
  {
    name:         "Mega Burger",
    price:        750,
    description:  "With 100g pork patty",
    category:       0
  },
  {
    name:         "Teriyaki Burger",
    price:        640,
    description:  "Grilled chicken with Teriyaki sorce",
    category:       0
  },
  {
    name:         "The fire Eater",
    price:        840,
    description:  "With hot cherry pepper rings",
    category:       0
  },
  {
    name:         "The Wolf Man",
    price:        730,
    description:  "Horsey sorce w/ Provolone cheese",
    category:       0
  },
  {
    name:         "The Spider Lady",
    price:        540,
    description:  "Lime sour cream, Mozzarella",
    category:       0
  },
  {
    name:         "The Two Headed Man",
    price:        740,
    description:  "American cheese on two patties",
    category:       0
  },
  {
    name:         "The Ring leader",
    price:        640,
    description:  "BBQ sorce, Onion rings",
    category:       0
  },
  {
    name:         "Yang&Dang burger",
    price:        840,
    description:  "Mushroom, Grilled onions",
    category:       0
  },
  {
    name:         "Buffalo Chicken Sandwich",
    price:        350,
    description:  "Meatballs, cheese & tomato ketchup",
    category:       1
  },
  {
    name:         "Pesto Chicken Sandwiches",
    price:        450,
    description:  "Pesto made of Homemade fresh basle",
    category:       1
  },
  {
    name:         "Chicken Bacon Avocado",
    price:        350,
    description:  "Used a whole avocado",
    category:       1
  },
  {
    name:         "Tostada Salad with Charbroiled Steak",
    price:        850,
    description:  "Tortilla shell with steak",
    category:      2
  },
  {
    name:         "Spicy Carrot Salad",
    price:        750,
    description:  "Grated carrots and minced garlic",
    category:      2
  },
  {
    name:         "Creole Green Beans",
    price:        700,
    description:  "Green beans and red onion slices",
    category:      2
  },
   {
    name:         "Cheese Fries",
    price:        380,
    description:  "Organic potetos",
    category:      3
  },
  {
    name:         "Fish Fillets",
    price:        320,
    description:  "Two peices, used olive oil",
    category:      3
  },
  {
    name:         "Chicken Tenders(5)",
    price:        650,
    description:  "BBQ taste",
    category:      3
  },
  {
    name:         "Apple Sprite",
    price:        250,
    description:  "Summer only",
    category:      4
  },
  {
    name:         "Peach iced tea",
    price:        250,
    description:  "Fresh pincky color",
    category:      4
  },
  {
    name:         "Root beer",
    price:        280,
    description:  "Clasic",
    category:      4
  },
  {
    name:         "Dark Chocolate",
    price:        250,
    description:  "Rich cacao",
    category:      5
  },
  {
    name:         "Raspberry with vanila",
    price:        300,
    description:  "Fruity",
    category:      5
  },
  {
    name:         "Mint and Chocolate",
    price:        280,
    description:  "With chocolate chip",
    category:      5
  }
]

Item.create!(items_attributes)

users_attributes = [
  {
    email:         "erttydfgh@aaa.aaa",
    first_name:    "John",
    last_name:     "Lennon",
    role:       0,
    password: "123456"
  },
  {
    email:         "ghjkyudfgh@aaa.aaa",
    first_name:    "Mick",
    last_name:     "Jagger",
    role:       0,
    password: "123456"
  },
  {
    email:         "tyuighj@ahk.com",
    first_name:     "Paul",
    last_name:      "McCartney",
    role:       1,
    password: "123456"
  },
  {
    email:         "ertyudfgh@aaa.aaa",
    first_name:    "Keith",
    last_name:     "Richards",
    role:       1,
    password: "123456"
  },
  {
    email:         "ghjktyuighj@uhkjhk.jp",
    first_name:    "George",
    last_name:     "Harrison",
    role:       2,
    password: "123456"
  },
  {
    email:         "fsdktfgghj@uhgghk.jp",
    first_name:    "Ringo",
    last_name:     "Starr",
    role:       2,
    password: "123456"
  },
  {
    email:         "ertyudfgh@aaa.aaa",
    first_name:    "Ronnie",
    last_name:     "Wood",
    role:       3,
    password: "123456"
  },
  {
    email:         "ertsdfdfgh@aaa.aaa",
    first_name:    "Charlie",
    last_name:     "Watts",
    role:       3,
    password:  "123456"
  }
]

User.create!(users_attributes)
