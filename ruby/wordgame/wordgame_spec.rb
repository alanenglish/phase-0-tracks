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

end
