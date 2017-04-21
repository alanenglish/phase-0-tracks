# - Set index variable to 0
# - While index < the word length
#    - Find character index value
#    - Reassign character to the next corresponding letter
#    - Add 1 to index variable
# - Print newly encrypted word

def encrypt(word)
index = 0
  while index < word.length
    word[index] = word[index].next!
    index += 1
  end
  p word
end

encrypt("program")




