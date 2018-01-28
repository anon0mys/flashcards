
require 'pry'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/guess.rb'
require './lib/round.rb'

class Runner

  def initialize
    @card_1 = Card.new("Question 1", "Answer 1")
    @card_2 = Card.new("Question 2", "Answer 2")
    @card_3 = Card.new("Question 3", "Answer 3")
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
    intro
  end

  def intro
    puts "Welcome! You are playing with #{@deck.cards.length} cards."
    45.times { print "-" }
    puts "\n"
  end

  def current_card_number
    card_number = @deck.cards.index(@round.current_card) + 1
    card_number
  end

  def guess
    guess = gets.chomp
    @round.record_guesses(guess)
  end

  def run
    while @round.guesses.length < @deck.cards.length
      puts "This is card #{current_card_number} of #{@deck.cards.length}"
      puts @round.current_card.question
      guess
      puts @round.guesses.last.feedback
    end
    round_end
  end

  def round_end
    puts "***** Game Over *****"
    puts "You had #{@round.number_correct} correct guesses out of #{@deck.cards.length} for a score of #{@round.percent_correct}"
  end

end

runner = Runner.new
runner.run
