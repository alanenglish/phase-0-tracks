puts "What's your Hamsters name?"
hamster_name = gets.chomp

puts "On volume scale of 1-10, 10 being the loudest, how loud does your hamster squeak?"
squeak_volume = gets.chomp.to_i
  if squeak_volume <= 5
    squeak_volume = "Quiet"
  elsif squeak_volume >= 6 && squeak_volume <= 10
    squeak_volume = "Loud"
  else
    squeak_volume = "Adopt at your own risk!"
  end

puts "What color is the hamsters fur?"
fur_color = gets.chomp

puts "Do you feel like this hamster could be adopted? (y/n)"
adoption_status = gets.chomp.downcase
  if adoption_status == "y" || adoption_status == "yes" || adoption_status == "duh" || adoption_status == "obvi"
    adoption_status = true
  else 
    adoption_status = false
  end

puts "How old would you say this hamster is?"
estimated_age = gets.chomp
  if estimated_age == ""
    estimated_age = nil
  else
    estimated_age = estimated_age.to_i
  end 

p "Name: #{hamster_name}"
p "Volume Level: #{squeak_volume}"
p "Fur Color: #{fur_color}"
p "Available for Adoption: #{adoption_status}"
p "Age: #{estimated_age}"