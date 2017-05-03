
# RELEASE 3 (EARLIER RELEASES MOVED TO BOTTOM)
# CREATE MIXIN MODULE
module Shout

  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yelling_happily(words)
    words + "!!!" + " :)"
  end

end

# CREATE CLASS FOR TARGARYEN
class Targaryen
  # INCLUDE SHOUT MIXIN MODULE
  include Shout

  # INITIALIZE INSTANCE METHOD
  def initialize
    puts "Initializing platinum blonde hair and fair skin..."
  end

end

# CREATE CLASS FOR WHITEWALKER
class Whitewalker
  # INCLUDE SHOUT MIXIN MODULE
  include Shout

  # INITIALIZE INSTANCE METHOD
  def initialize
    puts "Initializing abnormally strong mummy with glowing blue eyes..."
  end

end

# DRIVER CODE
targaryen = Targaryen.new
p targaryen.yell_angrily("But I want the Iron Throne")
p targaryen.yelling_happily("I am the Mother of Dragons")

whitewalker = Whitewalker.new
p whitewalker.yell_angrily("Please, anything but dragonglass or Valyrian steel")
p whitewalker.yelling_happily("The weather beyond the wall is so pleasant")

# CREATE STANDALONE MODULE
# module Shout
    
#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end

#   def self.yelling_happily(words)
#     words + "!!!" + " :)"
#   end

# end

# DRIVER CODE
# p Shout.yell_angrily("Damn you")
# p Shout.yelling_happily("I miss you")




