require 'pry'

class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards[@guesses.length] #Create a card index
  end

  def record_guesses(guess) #Call it record_guess
    @guesses << Guess.new(guess, current_card) #Should return the new guess instance
  end

  def number_correct #Simplify string with counter
    results = @guesses.map do |guess|
      guess.correct?.to_s
    end
    total = results.find_all { |result| result.include?("true") }
    total.count
  end

  def percent_correct
    decimal = number_correct/@guesses.length.to_f
    percent = decimal * 100
    percent.round
  end
end
