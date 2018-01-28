require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator.rb'
require './lib/card.rb'

class TestCardGenerator < Minitest::Test

  def setup
    @filename = "cards.txt"
    @cards = CardGenerator.new(@filename)
    @lines = ["What is 5 + 5?,10\n",
              "What is Rachel's favorite animal?,red panda\n",
              "What is Mike's middle name?,nobody knows\n",
              "What cardboard cutout lives at Turing?,Justin bieber\n"
            ]
  end

  def test_generator_initializes_with_file
    assert_instance_of CardGenerator, @cards
    assert_equal "cards.txt", @cards.filename
  end

  def test_generator_finds_file
    assert_output ("File found!\n") { @cards.file_exists }
  end

  def test_generator_reads_file_lines
    assert_equal  @lines, @cards.lines
  end

  def test_generator_creates_cards
    @cards.new_cards
    @cards.card_list.each do |card|
      assert_instance_of Card, card
    end
  end

  def test_generated_cards_have_questions_and_answers
    questions = ["What is 5 + 5?",
                  "What is Rachel's favorite animal?",
                  "What is Mike's middle name?",
                  "What cardboard cutout lives at Turing?"
                ]
    answers = ["10", "red panda", "nobody knows", "Justin bieber"]
    @cards.new_cards
    @cards.card_list.each.with_index do |card, index|
      assert_equal questions[index], card.question
      assert_equal answers[index], card.answer
    end
  end

end
