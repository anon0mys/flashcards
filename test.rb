require 'minitest/autorun'
require './flashcards.rb'

class TestFlashcards < Minitest::Test

  def setup
    @card_1 = Card.new("Question", "Answer")
    @card_2 = Card.new("Question", "Answer")
  end

  def test_card
    assert_instance_of(Card, @card_1)
    assert_instance_of(Card, @card_1)
  end
end
