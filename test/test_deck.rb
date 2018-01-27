require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess.rb'
require './lib/card.rb'
require './lib/deck.rb'

class TestGuess < Minitest::Test

  def setup
    @card_1 = Card.new("Question 1", "Answer 1")
    @card_2 = Card.new("Question 2", "Answer 2")
    @card_3 = Card.new("Question 3", "Answer 3")
    @deck = Deck.new([@card_1, @card_2, @card_3])
  end

  def test_deck_initializes_with_cards
    assert_instance_of Deck, @deck
    assert @deck.cards
  end

  def test_deck_count
    assert_equal 3, @deck.count
  end

end
