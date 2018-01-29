
require 'pry'
require 'date'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/guess.rb'
require './lib/round.rb'
require './lib/card_generator.rb'

class Runner

  def initialize
    if ARGV.length > 0
      @cards = set_file(ARGV.first.chomp)
    else
      @cards = set_file_name
    end
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    intro
  end

  def set_file_name
    puts "Please enter your filename"
    filename = STDIN.gets.chomp
    if filename =~ /.txt/
      set_file(filename)
    # elsif !filename.include?(".")
    #   filename = filename + ".txt"
    #   set_file(filename)
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

  def get_guess
    guess = STDIN.gets.chomp
    if guess =~ /hint/
      puts @round.current_card.hint
      get_guess()
    else
      @round.record_guesses(guess)
    end
  end

  def run
    while @round.guesses.length < @deck.cards.length
      puts "This is card #{current_card_number} of #{@deck.cards.length}"
      puts @round.current_card.question
      get_guess()
      check_guess()
    end
    round_end
  end

  def check_guess
    if @round.guesses.last.correct?
      puts @round.guesses.last.feedback
    else
      puts @round.guesses.last.feedback
      @deck.cards << @round.guesses.last.card
    end
  end

  def round_end
    puts "***** Game Over *****"
    puts "You had #{@round.number_correct} correct guesses out of #{@deck.cards.length} for a score of #{@round.percent_correct}"
    record_round
  end

  def record_round
    date_stamp = DateTime.now
    round_file_name = date_stamp.strftime("results-%F-%I:%M%P.txt")
    round_file = File.new("./lib/#{round_file_name}", "w")
    @round.guesses.each.with_index do |guess, index|
      round_file.write("Question #{index + 1} was: #{guess.card.question}\n") #Can I combine this into a single command?
      round_file.write("The Answer was : #{guess.card.answer}\n")
      round_file.write("You guessed: #{guess.guess}\n")
      round_file.write("Your answer was #{guess.feedback}\n\n")
    end
  end
end

runner = Runner.new
runner.run
