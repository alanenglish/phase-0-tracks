# RSPEC FOR WORDGAME
require_relative 'wordgame'

describe WordGame do
  let(:word) { WordGame.new("horse") }

it "checks if a letter has already been used" do
    #word.repeated_letter?('h')
    expect(word.repeated_letter?('h').join('')).to eq 'h'
  end
  
  it "guess correct letter" do
    expect(word.check_letter("h")).to be true
  end

  it "guess incorrect letter" do
    expect(word.check_letter("z")).to be false
  end

  it "stores guesses user has made" do
    word.check_letter("h")
    expect(word.guesses_made).to eq ["h"]
  end

  it "decrease guesses remaining by one" do
    word.check_letter("o")
    expect(word.guess_count).to eq 9
  end

  it "update user on progress" do
    word.check_letter("h")
    expect(word.progress_update).to eq "h _ _ _ _"
  end

  it "won the game" do
  end

  it "lost the game" do 
  end
end
