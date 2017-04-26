# Alan English and Jim Kyle
# Release 0
def dog_info
  puts "What's your dog's name?"
  dog = gets.chomp
  puts "What breed is he/she?"
  breed = gets.chomp
  yield(dog, breed)
end

puts "Lets test our block!"

dog_info { |dog, breed| puts "Wow, #{dog} is a lovely #{breed}!" }

puts "Thanks for playing!"

## Release 1
# Ninja Turtles Hash
turtles = {
  Leonardo: "Blue",
  Donatello: "Purple",
  Raphael: "Red",
  Michaelangelo: "Orange"
}
# Colors Array
colors = ["Black", "White", "Grey", "Pink"]

# .each Array
puts "Original Data:"
p colors

colors.each do |hue|
  puts "The color #{hue} is #{hue}..." 
end

puts "After .each call:"
p colors

# .each hash
puts "Original Data:"
p turtles

turtles.each do |name, color|
  puts "#{name} is #{color}"
end

puts "After .each call:"
p turtles

# .map! Array
puts "Original Data:"
p colors


colors.map! do |hue|
  puts "The color #{hue} is #{hue}..."
  hue.upcase
end

puts "After .map call:"
p colors

# Release 2
# Question 1

letters = {
  alpha: "a",
  beta: "b",
  delta: "d",
  epsilon: "e",
}

numbers = [1, 2, 3, 4, 5]

numbers.delete_if {|digit| digit < 3}
p numbers

letters.delete_if {|greek, letter| letter < "d" }
p letters

# Question 2

letters = {
  alpha: "a",
  beta: "b",
  delta: "d",
  epsilon: "e",
}

numbers = [1, 2, 3, 4, 5]

numbers.keep_if {|digit| digit < 3}
p numbers

letters.keep_if {|greek, letter| letter < "d"}
p letters

