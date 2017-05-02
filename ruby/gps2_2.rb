# Def method to create a grocery list
# Input: String of items separated by spaces (example: "carrots apples cereal pizza")
# Steps:
  # Create a hash for grocery item types and quantities of each item
  # Set the inputted grocery items as keys, set default quantity 
  # Call our last method which will print a nice version of the list
# Output: Return hash

def create_a_list(str)
  grocery_list = {}
  array_of_strings = str.split(" ")
  array_of_strings.each do |grocery_item|
    grocery_list[grocery_item] = 1
  end
  print_pretty_list(grocery_list)
end

# Def method to add an item to our grocery list
# Input: list, item name, and optional quantity of the item
# Steps:
  # If list item already exists on the grocery list
    # Add optional quantity to the existing value of item
  # Else list[item] and set optional_quantity with assignment operator
# Output: Return hash with updated items/quantities

def add_to_list(grocery_list, item_name, optional_quantity=1)
  if grocery_list.has_key?(item_name)
    grocery_list[item_name] += optional_quantity
  else
    grocery_list[item_name] = optional_quantity
  end
  grocery_list
end


# Def method to remove an item from the grocery list
# Input: list, item name
# Steps: list[item] and built in method to delete(key)
# Output: Return hash

def remove_from_list(grocery_list, item_name)
  grocery_list.delete(item_name)
  grocery_list
end


# Def method to update the quantity of an item
# Input: list, item name, quantity
# Steps: list[item] assign new quantity
# Output: Return hash

def update_quantity(grocery_list, item_name, quantity)
  grocery_list[item_name] = quantity
  grocery_list
end


# Def method to print a list and make it look pretty
# Input: list
# Steps: 
  # Puts "Here is your grocery list:"
  # Iterate through the list and print each key and value pair on its own line
# Output: Prints pretty version of the grocery list

def print_pretty_list(grocery_list)
  puts "Here is your grocery list:"
  puts "-" * 10
  grocery_list.each do |item_name, quantity|
    puts "#{item_name}: #{quantity}"
  end
  puts "-" * 10
end

# TEST CODE

# create_a_list("carrots apples cereal pizza")

# new_list = {
#   "Lemonade" => 2,
#   "Tomatoes" => 3,
#   "Onions" => 1,
#   "Ice Cream" => 4,
#   "Chips" => 8
# }

# remove_from_list(new_list, "Lemonade")

# update_quantity(new_list, "Ice Cream", 1)

# print_pretty_list(new_list)