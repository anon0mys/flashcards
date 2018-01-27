require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'

class TestCard < Minitest::Test

  def test_card_initializes_properly
    card = Card.new("Question", "Answer")
    assert_instance_of Card, card
    assert card.question
    assert card.answer
  end
end
