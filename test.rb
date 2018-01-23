$LOAD_PATH << '.'
require 'flashcards.rb'

def test_card
  card = Card.new("question", "answer")
  puts card.question
  puts card.answer
end

test_card
