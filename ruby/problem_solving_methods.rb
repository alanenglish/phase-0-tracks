# - Create an Array
# - Define the method that takes array and number searched as input
# - For each item in the array
# => - Check if item is equal to searched value
# => - If yes, return index
# => - If no, move to next
# => - If item not found, return nil

numbers = [17, 93, 4, 6, 99, 74, 25]

def search_array(arr, number)
  index = 0
  arr.each do |value|
    if value == number
      return index
    elsif arr.length - 1 == index
      return nil 
    else
      index += 1 
    end
  end
end

p search_array(numbers, 25)
