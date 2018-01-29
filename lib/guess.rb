
class Guess
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def response
    answer = @card.answer
    answer
  end

  def correct?
    @guess.downcase == response.downcase
  end

  def feedback
    if correct?
      result = "Correct!"
    else
      result = "Incorrect"
    end
    result
  end
end
