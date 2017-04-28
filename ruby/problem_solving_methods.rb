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

# - Define method that takes the nth Fibonacci number
# - Start with [0, 1] array = arr
# - Start fibcount (to know which fib number we are on) at 2
# - While fibcount is less than n:
# =>  - Shovel sum of last two array entries back into array
# - Return array
# - To check, use search_array method to compare to fib(100) known value

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
p fib(6)
p search_array(fib(100), 218922995834555169026) == 99


# RELEASE 2 - Sort an Array

# PSEUDOCODE FOR MERGE SORT
# - Break integers down into units
# - Compare each integer with adjacent integer, in pairs
# - Sort the pairs, and then group together after sorted
# - Compare adjacent groups by taking first integer of each
#   and placing in new ordered list if that integer is selected
#   and then compare the next two integers remaining in the group.
# - Repeat step above until all elements are in new ordered list

# Integrate Bubble Sort (Merge Sort too Advanced...)
# PSUEDOCODE FOR BUBBLE SORT
# - From left to right
# => - Compare first two integers, and place smaller value on left side
# => - Slide over one integer, and now compare the 2nd and 3rd integer,
# =>   and place smaller value on left.
# => - Slide over one integer, and now compare the 3rd and 4th integer,
# =>   and place smaller value on left.
# => - Continue above steps until all pairs have been sorted and the end
# =>   of the data set has been reached.
# - Return to the far left of the data set, and repeat pair comparisons
#   with the first two integers that are now in place, placing smaller
#   value to the left.
# =>  - Repeat until all pairs have been evaluated and sorted
# - Continue sorting pairs from left to right until all values have
#   been sorted in order and then STOP.


def bubble_sort(array)
  n = array.length
  loop do
    swapped = false
    (n-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1]=array[i+1], array[i]
        swapped = true
      end
    end
    break if not swapped
  end
  array
end

bubbles = [47, 63, 88, 14, 34, 65, 21, 98, 23, 52, 82, 55, 12]
p bubble_sort(bubbles)

def bubblesort(list)
  swapped = true
  while swapped do
    swapped = false
    0.upto(list.size-2) do |i|
      p "run"
      if list[i] > list[i+1]
        list[i], list[i+1] = list[i+1], list[i]
        swapped = true
      end
    end    
  end
  list
end

p bubblesort(bubbles)