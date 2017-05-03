class Santa

  def initialize
    puts "Initializing Santa Instance..."
  end

  def speak
    puts "Ho, ho, ho,! Haaaappy Holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type} cookie!"
  end

end

# DRIVE CODE
nicholas = Santa.new

nicholas.speak

nicholas.eat_milk_and_cookies("Chocolate Chip")




