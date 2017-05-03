class Santa
  attr_reader :age, :ethnicity, :reindeer_ranking
  attr_accessor :gender

  def initialize(gender, ethnicity)
    puts "Initializing Santa Instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
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
nicholas = Santa.new("white walker", "dire wolf")

p nicholas.reindeer_ranking

p nicholas.get_mad_at("Cupid")

p nicholas.gender=("john snow")

nicholas.celebrate_birthday

p nicholas.age

p nicholas.ethnicity

# nicholas.speak

# nicholas.eat_milk_and_cookies("Chocolate Chip")

# santas = []

# example_genders = ["male", "female", "white walker", "agender", "bigender", "mermaid"]
# example_ethnicities = ["black", "white", "latino", "asian", "alien", "dire wolf"]

# example_genders.length.times do |i|
#   santas << Santa.new(example_genders[i], example_ethnicities[i])
# end



