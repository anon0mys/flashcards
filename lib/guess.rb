require 'pry'

class Guess
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def response
    @card.answer
  end

  def correct?
    @guess.downcase == response.downcase
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect"
    end
  end
end
