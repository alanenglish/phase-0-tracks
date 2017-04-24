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
# => "STOP! YOU’RE UNDER ARREST!"

p "the usual".concat(" suspects")
p "the usual" << " suspects"
p "the usual".replace "the usual suspects"
p "the usual".insert(9, " suspects")
p "the usual" + " suspects"
# => "the usual suspects"

p " suspects".prepend("the usual")
p " suspects".insert(0, "the usual")
p " suspects".replace("the usual suspects")
p " suspects".sub(" suspects", "the usual suspects")
# => "the usual suspects"

p "The case of the disappearing last letter".chop
p "The case of the disappearing last letter".chomp("r")
p "The case of the disappearing last letter"[0..38]
p "The case of the disappearing last letter"[-40..-2]
p "The case of the disappearing last letter".sub("letter", "lette")
# => "The case of the disappearing last lette"

p "The mystery of the missing first letter"[1..39]
p "The mystery of the missing first letter"[-38..-1]
p "The mystery of the missing first letter".sub("The", "he")
# => "he mystery of the missing first letter"

p "Elementary,    my   dear        Watson!".squeeze" "
# => "Elementary, my dear Watson!"

p "z".ord
# => 122 
# (What is the significance of the number 122 in relation to the character z?)
# This is interesting, in the American Standard Code for Information Interchange, lowercase a begins at 97 and the alphabet continues until
# it reaches 122 for z, I have no idea what the significance is - can't seem
# to find an easy answer by searching. 

p "How many times does the letter 'a' appear in this string?".count("a")
# => 4