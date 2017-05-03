class Santa
  attr_reader :age, :ethnicity, :reindeer_ranking
  attr_accessor :gender

  def initialize(gender, ethnicity)
    puts "Initializing Santa Instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = rand(0..140)
  end

  def speak
    puts "Ho, ho, ho,! Haaaappy Holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type} cookie!"
  end

   def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer_name)
    @reindeer_ranking.insert(-1, @reindeer_ranking.delete(reindeer_name))
  end

end

# DRIVE CODE

p nicholas = Santa.new("white walker", "dire wolf")
# p nicholas.reindeer_ranking
# p nicholas.get_mad_at("Cupid")
# p nicholas.gender=("john snow")
# nicholas.celebrate_birthday
# p nicholas.age
# p nicholas.ethnicity
# nicholas.speak
# nicholas.eat_milk_and_cookies("Chocolate Chip")

santas = []

example_genders = ["male", "female", "white walker", "agender", "bigender", "mermaid"]
example_ethnicities = ["black", "white", "latino", "asian", "alien", "dire wolf"]

# example_genders.length.times do |i|
#   santas << Santa.new(example_genders[i], example_ethnicities[i])
# end

# CREATE LOOP TO MASS PRODUCE DIVERSE SANTAS

counter = 0
until counter == 20
  santas << Santa.new(example_genders.sample, example_ethnicities.sample)
  counter += 1
end

# ITERATE THRU ARRAY DATA STRUCTURE AND PRINT SANTA ATTRIBUTES

santas.each_with_index do |santa, index|
  puts "Santa instance number: #{index+1}" 
  puts "Age: #{santa.age}"
  puts "Gender: #{santa.gender}"
  puts "Ethnicity: #{santa.ethnicity}"
  puts "Favorite Rides: #{santa.reindeer_ranking}"
end
