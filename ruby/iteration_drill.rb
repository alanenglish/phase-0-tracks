# Array Drills

zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]

# 1. Iterate through the zombie_apocalypse_supplies array,
# printing each item in the array separated by an asterisk
# ----

p zombie_apocalypse_supplies.join(" * ")

# 2. In order to keep yourself organized, sort your zombie_apocalypse_supplies
# in alphabetical order. Do not use any special built-in methods.
# ----

def alpha_sort_method(arr)
  return arr if arr.length <= 1
  loop do
    sorted = false
    (arr.length-1).times do |i|
      if arr[i].downcase > arr[i+1].downcase
        arr[i], arr[i+1] = arr [i+1], arr[i]
        sorted = true
      end
    end
    break if !sorted
  end
  arr
end

p alpha_sort_method(zombie_apocalypse_supplies)

# 3. Create a method to see if a particular item (string) is in the
# zombie_apocalypse_supplies. Do not use any special built-in methods.
# For instance: are boots in your list of supplies?
# ----

def search_array(arr, string)
  arr.each do |item|
    return true if item == string
  end
  false
end

# 4. You can't carry too many things, you've only got room in your pack for 5.
# Remove items in your zombie_apocalypse_supplies in any way you'd like,
# leaving only 5. Do not use any special built-in methods.
# ----

def light_packer(arr, count)
  light_bag = []
  counter = 0
  arr.each do |item|
    new_bag << item
    counter += 1
    break if counter == count
  end
  light_bag
end

p light_packer(zombie_apocalypse_supplies, 5)

# 5. You found another survivor! This means you can combine your supplies.
# Create a new combined supplies list out of your zombie_apocalypse_supplies
# and their supplies below. You should get rid of any duplicate items.
# Find the built-in method that helps you accomplish this in the Ruby
# documentation for Arrays.
other_survivor_supplies = [ "warm clothes", "rations", "compass", "camp stove",
                            "solar battery", "flashlight"]
# ----

combined_supplies = (zombie_apocalypse_supplies + other_survivor_supplies).uniq

# Hash Drills

extinct_animals = {
  "Tasmanian Tiger" => 1936,
  "Eastern Hare Wallaby" => 1890,
  "Dodo" => 1662,
  "Pyrenean Ibex" => 2000,
  "Passenger Pigeon" => 1914,
  "West African Black Rhinoceros" => 2011,
  "Laysan Crake" => 1923
}

# 1. Iterate through extinct_animals hash, printing each key/value pair
# with a dash in between the key and value, and an asterisk between each pair.
# ----

extinct_animals.each {|key, value| puts "#{key} - #{value} *"}

# 2. Keep only animals in extinct_animals if they were extinct before
# the year 2000. Do not use any special built-in methods.
# ----

def extinct_prior(hash)
  new_animals = {}
  hash.each do |key, value|
    if value < 2000
    new_animals[key] = value
  end
end
hash = new_animals
end

p extinct_prior(extinct_animals)

# 3. Our calculations were completely off, turns out all of those animals went
# extinct 3 years before the date provided. Update the values in extinct_animals
# so they accurately reflect what year the animal went extinct.
# Do not use any special built-in methods.
# ----

extinct_animals.each {|animal, year| extinct_animals[animal] = year-3}

p extinct_animals

# 4. You've heard that the following animals might be extinct, but you're not sure.
# Check if they're included in extinct_animals, one by one:
# "Andean Cat"
# "Dodo"
# "Saiga Antelope"
# Do not use any special built-in methods.
# ----

# 5. We just found out that the Passenger Pigeon is actually not extinct!
# Remove them from extinct_animals and return the key value pair as a two item array.
# Find the built-in method that helps you accomplish this in the Ruby documentation
# for Hashes.
# ----
