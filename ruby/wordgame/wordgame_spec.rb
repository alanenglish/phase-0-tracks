# RSPEC FOR WORDGAME

require_relative 'wordgame'

describe WordGame do
  let(:word) { WordGame.new("horse") }

  it "number of guesses allowed" do
    expect(word.max_guesses_allowed).to eq 5
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
    word.max_guesses_allowed
    expect(word.decrease_guess_count).to eq 4
  end

  it "update user on progress" do
  end

  it "accidental same guess doesn't count" do
  end

  it "won the game" do
  end

  it "lost the game" do 
  end

end
