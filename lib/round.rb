require 'pry'

class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards[@guesses.length]
  end

  def record_guesses(guess)
    @guesses << Guess.new(guess, current_card)
  end

  def number_correct
    results = @guesses.map do |guess|
      guess.correct?.to_s
    end
    total = results.find_all { |result| result.include?("true") }
    total.count
  end
end
