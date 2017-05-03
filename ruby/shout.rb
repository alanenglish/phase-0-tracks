module Shout
  
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yelling_happily(words)
    words + "!!!" + " :)"
  end

end

#DRIVER CODE
p Shout.yell_angrily("Damn you")
p Shout.yelling_happily("I miss you")

