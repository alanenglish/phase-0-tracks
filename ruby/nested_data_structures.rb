food_court = {
  chick_fil_a: {
    restaurant: "Chick-Fil-A",
    manager: "Roger Chickadoo",
    menu: ["Nuggets", "Chicken Sandwich", "Waffle Fries"]
  },
  burger_king: {
    restaurant: "Burger King",
    manager: "Robert King",
    menu: ["Whopper", "Baconator", "Curly Fries"]
  },
  china_wok: {
    restaurant: "China Wok",
    manager: "Jimmy Chang",
    menu: ["General Changs Chicken", "Kung Pao Shrimp", "Wonton Soup"]
  },
  smoothie_king: {
    restaurant: "Smoothie King",
    manager: "JB Smoove",
    menu: ["Tropical Paradise", "Mango Crush", "Strawberry Bonanza"]
  }
}

p food_court[:chick_fil_a][:menu]
p food_court[:china_wok][:menu] << "Hot and Sour Soup"
p food_court[:smoothie_king][:manager] = "J.B. Smoove"
p food_court[:burger_king][:menu].reverse!
p food_court[:china_wok][:manager]
p food_court[:chick_fil_a][:menu].push("Milk Shake")
p food_court[:smoothie_king][:menu][2]
p food_court