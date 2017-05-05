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
  attr_accessor :word, :guess_count, :letters_guessed, :correct_guess

  def initialize(string)
    @word = string.split("")
    @guess_count = 0
    @letters_guessed = []
  end

  def max_guesses_allowed
    @guess_count = @word.length
  end

  def check_letter(letter)
    if @word.include?(letter)
      @letters_guessed << letter
      @correct_guess = true
    else
      @letters_guessed << letter
      @correct_guess = false
    end
  end

  def guesses_made
    @letters_guessed
  end

  def decrease_guess_count
    @guess_count -= 1
  end

end


# word = WordGame.new("hello")
# word.check_letter("h")
# p word.guesses_made


