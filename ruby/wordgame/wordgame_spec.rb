require_relative 'wordgame'

describe WordGame do
  let(:word) { WordGame.new("horse") }

  it "number of guesses allowed" do
    expect(word.max_guesses_allowed).to eq 5
  end

end
