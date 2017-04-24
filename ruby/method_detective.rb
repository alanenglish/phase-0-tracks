# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have 
# committed the crime, add additional calls to prove it.

"iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

"zom".gsub(/[o]/, "o" => "oo")
"zom".insert(2, "o")
"zom".replace "zoom"
"zom".sub("o", "oo")
# => "zoom"

"enhance".center(15)
"enhance".replace("    enhance    ")
# => "    enhance    "

"Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

"the usual".concat(" suspects")
"the usual" << " suspects"
"the usual".replace "the usual suspects"
"the usual".insert(9, " suspects")
"the usual" + " suspects"
# => "the usual suspects"

" suspects".prepend("the usual")
" suspects".insert(0, "the usual")
" suspects".replace("the usual suspects")
" suspects".sub(" suspects", "the usual suspects")
# => "the usual suspects"

"The case of the disappearing last letter".chop
"The case of the disappearing last letter".chomp("r")
"The case of the disappearing last letter"[0..38]
"The case of the disappearing last letter"[-40..-2]
"The case of the disappearing last letter".sub("letter", "lette")
# => "The case of the disappearing last lette"

"The mystery of the missing first letter"[1..39]
"The mystery of the missing first letter"[-38..-1]
"The mystery of the missing first letter".sub("The", "he")
"The mystery of the missing first letter".delete("T")
# => "he mystery of the missing first letter"

"Elementary,    my   dear        Watson!".squeeze
# => "Elementary, my dear Watson!"

"z".ord
# => 122 
# (What is the significance of the number 122 in relation to the character z?)
# This is interesting, in the American Standard Code for Information Interchange, lowercase a begins at 97 and the alphabet continues until
# it reaches 122 for z, I have no idea what the significance is - can't seem
# to find an easy answer by searching. 

"How many times does the letter 'a' appear in this string?".count("a")
# => 4