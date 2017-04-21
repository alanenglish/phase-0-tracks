# - Set index variable to 0
# - While index < the word length
#    - Unless index contains space
#       - Find character index value
#       - Reassign character to the next corresponding letter
#    - Add 1 to index variable
# - Print newly encrypted word

def encrypt(word)
  index = 0
  while index < word.length
    unless word[index] == " "
      if word[index] == "z"
        word[index] = "a"
      else
        word[index] = word[index].next!
      end
    end
    index += 1
  end
  p word
end

encrypted_word = encrypt("zed")

# - Set index variable to 0
# - Set alphabet variable 
# - While index < the word length
#   - Unless index contains space
#      - Use word index to find corresponding index in alphabet variable
#      - Subtract 1 from corresponding index in alphabet
#      - Assign that value to alpha_index variable
#      - Use alpha_index to find corresponding letter in alphabet
#      - Assign corresponding letter in alphabet to current word index
#   - Add 1 to index variable
# - Print decrypted word


def decrypt(word)
  index = 0
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  while index < word.length
    unless word[index] == " "
    alpha_index = alphabet.index(word[index]) - 1
    word[index] = alphabet[alpha_index]
    end
    index+=1
  end
  p word
end

decrypt(encrypted_word)



