# - Define encrypt method with one parameter (name)
# - Split the given name into array 
# - Set vowel array
# - Set consonants array
# - Set the index at 0
# - For each character, first check edge case for "u" and "z"
# - Then check each character for vowel or consonant, and change value
# - Increase index by 1 to move to next character
# - Change name from array to string by joining together
# - Split back to array with just two index, first and last name
# - Capitalize the first letter of both first and last name
# - Swap the first and last name
# - Join together as string
# - Print result

def encrypt(name)
  new_alias = name.downcase.split("")
  vowels = "aeiou".split("")
  consonants = "bcdfghjklmnpqrstvwxyz".split("")
  index = 0
  new_alias.each do |letter|
    if letter == "u"
      new_alias[index] = "a"
    elsif letter == "z"
      new_alias[index] = "b"  
    elsif vowels.include?(letter)
        vowel = vowels.index(letter)+1
        new_alias[index] = vowels[vowel]
    elsif consonants.include?(letter)
        consonant = consonants.index(letter)+1
        new_alias[index] = consonants[consonant]
    else
      letter
    end
  index += 1
  end
  new_alias = new_alias.join("").split(" ").each {|name| name.capitalize!}.rotate.join(" ")
  puts "Your alias has been processed. #{name} will now be known as #{new_alias}."

new_alias 
end

# encrypt("Felicia Torres")
# Create database for user entries
encrypted_database = []
# Loop until user enters "quit"
loop do
  puts "Please enter an agents name to retrieve their secret alias. (please type 'quit' to exit)."
  name = gets.chomp
    if name == "quit"
      break
    else
        name = name.split(" ").each {|name| name.capitalize!}.join(" ")
        encrypted_database << {"Real Name" => name, "Encrypted Name" => encrypt(name)}
    end
end
# Print list of results
puts "Here is a list of all DBC Agents and their secret alias - keep this hidden and safe!"
p encrypted_database

