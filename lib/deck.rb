
class Deck
  attr_reader :cards

  def initialize(card_array)
    @cards = card_array
  end

  def count
    @cards.count
  end

end
