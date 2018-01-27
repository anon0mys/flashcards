require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess.rb'
require './lib/card.rb'

class TestGuess < Minitest::Test

  def setup
    @card_1 = Card.new("Question", "Answer")
    @good_guess = Guess.new("Answer", @card_1)
    @bad_guess = Guess.new("Guess", @card_1)
  end

  def test_guess_initializes_properly
    assert_instance_of Guess, @good_guess
    assert "Guess", @good_guess
    assert @good_guess.card
  end

  def test_guess_can_see_correct_answer
    assert_equal "Answer", @good_guess.response
  end

  def test_guess_compares_against_answer
    assert @good_guess.correct?
    refute @bad_guess.correct?
  end

  def test_guess_feedback
    assert_output ("Correct!\n") { @good_guess.feedback }
    assert_output ("Incorrect, please guess again.\n") { @bad_guess.feedback }
  end

end
