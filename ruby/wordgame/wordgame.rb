# WordGame Pseudocode
# - def WordGame class
# - def initialize instance method with string parameter (only one word allowed)
#   - create initial state variables for string (to be converted to array), guess count,
#     and letters guessed array
# - def maximum guesses allowed count by length of word
# - def decrease guess count method
# - def progress display method
# - def guesses made method that moves previous guesses into array
# - def check letter method
#   - decrease guess count by 1, unless guess is correct
#   - display correctly guessed letter in progress display
#   - continue to ask for another letter if word game not over
# - congratulate user if wins, or taunt if loses

class WordGame
  attr_accessor :word, :guess_count, :letters_guessed

  def initialize(string)
    @word = string.split("")
    @guess_count = 0
    @letters_guessed = [nil]
  end

end




