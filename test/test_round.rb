require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess.rb'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'

class TestRound < Minitest::Test

  def setup
    @card_1 = Card.new("Question 1", "Answer 1")
    @card_2 = Card.new("Question 2", "Answer 2")
    @card_3 = Card.new("Question 3", "Answer 3")
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
    @guesses = ["Answer 1", "Wrong Answer", "Answer 3"]
  end

  def test_round_initailizes_with_deck
    assert_instance_of Round, @round
    assert @round.deck
  end

  def test_round_guesses_array
    assert_equal [], @round.guesses
  end

  def test_round_tracks_current_card
    @deck.cards.each do |card|
      assert_equal card, @round.current_card
      @round.guesses << 1
    end
  end

  def test_round_records_guesses
    @round.record_guesses("Answer 1")
    assert_instance_of Guess, @round.guesses[0]
    assert_equal "Answer 1", @round.guesses[0].guess
  end

  def test_round_counts_guesses
    @guesses.each.with_index do |guess, index|
      @round.record_guesses(guess)
      assert_equal index + 1, @round.guesses.count
    end
  end

  def test_round_gets_guess_feedback
    @guesses.each do |guess|
      @round.record_guesses(guess)
    end
    assert_equal "Correct!", @round.guesses.first.feedback
    assert_equal "Incorrect", @round.guesses[1].feedback
    assert_equal "Correct!", @round.guesses.last.feedback
  end

  def test_round_counts_correct_guesses
    @guesses.each do |guess|
      @round.record_guesses(guess)
    end
    assert_equal 2, @round.number_correct
  end

  def test_round_percent_correct
    @guesses.each do |guess|
      @round.record_guesses(guess)
    end
    assert_equal 66, @round.percent_correct
  end

end
