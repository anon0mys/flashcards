
require 'pry'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/guess.rb'
require './lib/round.rb'
require './lib/card_generator.rb'

class Runner

  def initialize
    @cards = set_file_name
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    intro
  end

  def set_file_name
    puts "Please enter your filename"
    filename = gets.chomp
    if filename =~ /.txt/
      set_file(filename)
    elsif !filename.include?(".")
      filename = filename + ".txt"
      set_file(filename)
    else
      puts "Please enter a valid file type (.txt)"
      set_file_name
    end
  end

  def set_file(filename)
    if File.exist?("./lib/#{filename}")
      CardGenerator.new(filename).new_cards
    else
      puts "Your file does not exist, please enter another file."
      set_file_name
    end
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
    stats = {
      correct: @round.number_correct,
      out_of: @deck.cards.length,
      score: @round.percent_correct
    }
    puts "***** Game Over *****"
    puts "You had #{stats[:correct]} correct guesses out of #{stats[:out_of]} for a score of #{stats[:score]}"
  end

end

runner = Runner.new
runner.run
