# RELEASE 0

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



# RELEASE 1


# Define method that takes the 'n'th Fibonacci number
# Assign known answer to fib(100) to variable: constant
# Start with [0, 1] array, call it origin
# start fibcount (to know which fib number we are on) (start at 2? 1?)
# WHile fibcount is less than n:
# =>  shovel sum of last two array entries back into array
# return array

# To check, use method above search_array(contant)

def fib(n)
  arr = [0, 1]
  fibcount = 2
  if n == 1 
    return [0]
  elsif n == 0
    return []
  else
    while fibcount < n
      arr << arr[-2] + arr[-1]
      fibcount += 1
    end
  end
  return arr
end
  
p fib(0)
p fib(1)
p fib(2)
p search_array(fib(100), 218922995834555169026) == 99










