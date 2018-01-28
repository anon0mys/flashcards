
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
    @guess == response
  end

  def feedback
    if correct?
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end
end
