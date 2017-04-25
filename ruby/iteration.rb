# Alan English and Jim Kyle

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


#   puts "What's your dog's name?"
#   dog = gets.chomp
#   puts "What breed is he/she?"
#   breed = gets.chomp

# def dog_info(dog, breed)
#   puts "Wow, #{dog} is a lovely #{breed}!"
# end

# dog_info( "#{dog}", "#{breed}")