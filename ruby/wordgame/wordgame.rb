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
  attr_reader :guess_count, :game_over, :answer

  def initialize(string)
    @answer = string
    @word = string.split("")
    @guess_count = @word.length * 2
    @letters_guessed = []
    @word_progress = %w( _ ) * @word.length
    @game_over = false
  end 

  def letters_to_array(letter)
    @letters_guessed << letter
  end

  def repeated_letter?(letter)
    check_letter(letter) if !@letters_guessed.include?(letter)
  end

  def check_letter(letter)
    letters_to_array(letter)
        @word.each_with_index do |char, index|
          if char == letter
            @word_progress[index] = char
          end
        end
      @guess_count -= 1
    letter
  end

  def progress_update
    @word_progress.join(' ')
  end

  def win
    if @word_progress.join('') == @answer
    @game_over = true
    end
  end

  def word_guess(word)
    if word == @word.join('') 
      @game_over = true
    end
  end
end


# USER INTERFACE

puts "Welcome to WordGame!"
puts "Please enter a word you would like your opponent to guess?"
user_word = gets.chomp
word = WordGame.new(user_word)
puts "What is your first name?"
user_name = gets.chomp

until word.win || word.guess_count == 0 
puts "#{user_name.capitalize}, please guess a letter!"
user_letter = gets.chomp
word.repeated_letter?(user_letter)
  if user_word.include?(user_letter)
    puts "Nice Guess!"
  else
    puts "Sorry, there is no #{user_letter.upcase}!"
  end
puts "Vanna, please show #{user_name.capitalize} their progress: #{word.progress_update.upcase}"
puts "You currently have #{word.guess_count} guesses remaining!" if !word.win
puts "Congratulations #{user_name.capitalize}! You guessed '#{user_word}' correctly!" if word.win
puts "You have lost the game. Shame on you and your entire family!" if word.guess_count == 0
end 


