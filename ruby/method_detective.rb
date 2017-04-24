# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have 
# committed the crime, add additional calls to prove it.

p "iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

p "zom".gsub(/[o]/, "o" => "oo")
p "zom".insert(2, "o")
p "zom".replace "zoom"
p "zom".sub("o", "oo")
# => "zoom"

p "enhance".center(15)
p "enhance".replace("    enhance    ")
# => "    enhance    "

p "Stop! You’re under arrest!".upcase
p "Stop! You're under arrest!". replace("STOP! YOU'RE UNDER ARREST!")
# => "STOP! YOU’RE UNDER ARREST!"

p "the usual".concat(" suspects")
p "the usual" << " suspects"
p "the usual".replace "the usual suspects"
p "the usual".insert(9, " suspects")
# => "the usual suspects"

# " suspects".<???>
# => "the usual suspects"

# "The case of the disappearing last letter".<???>
# => "The case of the disappearing last lette"

# "The mystery of the missing first letter".<???>
# => "he mystery of the missing first letter"

# "Elementary,    my   dear        Watson!".<???>
# => "Elementary, my dear Watson!"

# "z".<???>
# => 122 
# (What is the significance of the number 122 in relation to the character z?)

# "How many times does the letter 'a' appear in this string?".<???>
# => 4