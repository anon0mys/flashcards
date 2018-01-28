
def setup
  @round = Round.new(@deck1)
end

def test_record_guess_shovels_into_guesses_array
  assert_instance_of Guess, round.record_guess("Richmond")
  assert_equal round.guesses.length, 1
  assert_equal round.record_guess("Richmond").card, @card_1
end
